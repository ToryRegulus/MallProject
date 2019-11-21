from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from common.models import Goods, Types
from django.db.models import Q
from datetime import datetime
from PIL import Image
import time

# Create your views here.


def index(request):
    """商品信息主页面"""
    tlist = Types.objects.extra(select={
        'path_id': 'concat(path,id)'
    }).order_by('path_id')
    for ob in tlist:
        ob.pname = '. . .' * (ob.path.count(',') - 1)
    mod = Goods.objects
    mywhere = []

    # 获取、判断并封装关keyword键搜索
    kw = request.GET.get('keyword', None)
    if kw:
        # 查询商品名中只要含有关键字的都可以
        good_list = mod.filter(goods__contains=kw)
        mywhere.append('keyword=' + kw)
    else:
        good_list = mod.filter()
    # 获取、判断并封装商品类别typeid搜索条件
    typeid = request.GET.get('typeid', '0')
    if typeid != '0':
        tids = Types.objects.filter(Q(id=typeid) | Q(pid=typeid)).values_list(
            'id', flat=True)
        good_list = good_list.filter(typeid__in=tids)
        mywhere.append('typeid=' + typeid)
    # 获取、判断并封装商品状态state搜索条件
    state = request.GET.get('state', '')
    if state != '':
        good_list = good_list.filter(state=state)
        mywhere.append('state=' + state)

    # 获取商品类别名称
    for vo in good_list:
        ty = Types.objects.get(id=vo.typeid)
        vo.typename = ty.name

    # 实现分页功能
    paginator = Paginator(good_list, 10)  # 实例化Paginator, 每页显示3条数据
    page = request.GET.get('page', 1)
    Pag = paginator.page(page)

    context = {'goodslist': Pag, 'mywhere': mywhere, 'typelist': tlist}
    return render(request, 'backstage/goods/index.html', context)


def add(request):
    """添加商品信息"""
    # 获取商品类别信息
    type_list = Types.objects.extra(select={
        'path_id': 'concat(path, id)'
    }).order_by('path_id')

    for ob in type_list:
        ob.pname = '. . . ' * (ob.path.count(',') - 1)

    context = {'typelist': type_list}
    return render(request, 'backstage/goods/add.html', context)


def insert(request):
    """执行添加"""
    try:
        # 图片的上传处理
        myfile = request.FILES.get('PIC', None)
        if not myfile:
            context = {
                'Info': 'Addition Failed',
                'Detail': 'No images detected'
            }
            return render(request, 'backstage/info.html', context)
        filename = str(time.time()) + '.' + myfile.name.split('.').pop()
        with open('./Mallproject/static/commodity/' + filename,
                  'wb+') as destination:
            for chunk in myfile.chunks():  # 分块写入文件
                destination.write(chunk)

        # 图片的缩放
        im = Image.open('./Mallproject/static/commodity/' + filename)
        # 缩放到375*375(缩放后的宽高比例不变):
        im.thumbnail((375, 375))
        im.save('./Mallproject/static/commodity/' + filename, None)

        im = Image.open('./Mallproject/static/commodity/' + filename)
        # 缩放到220*220(缩放后的宽高比例不变):
        im.thumbnail((220, 220))
        im.save('./Mallproject/static/commodity/m_' + filename, None)

        im = Image.open('./Mallproject/static/commodity/' + filename)
        # 缩放到75*75(缩放后的宽高比例不变):
        im.thumbnail((75, 75))
        im.save('./Mallproject/static/commodity/s_' + filename, None)

        ob = Goods()
        ob.typeid = request.POST['typeID']
        ob.goods = request.POST['commodityName']
        ob.company = request.POST['Manufacturer']
        ob.price = request.POST['unitPrice']
        ob.store = request.POST['Inventory']
        ob.content = request.POST['productIntroduction']
        ob.picname = filename
        ob.state = 1
        ob.addtime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        return redirect('/backstage/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Addition Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def edit(request, gid):
    """商品信息编辑"""
    try:
        ob = Goods.objects.get(id=gid)
        context = {'goods': ob}
        return render(request, 'backstage/goods/edit.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def update(request, gid):
    """执行编辑"""
    ob = Goods.objects.get(id=gid)
    ob.goods = request.POST['commodityName']
    ob.company = request.POST['Manufacturer']
    ob.price = request.POST['unitPrice']
    ob.store = request.POST['Inventory']
    ob.content = request.POST['productIntroduction']
    ob.save()
    return redirect('/backstage/goods')


def delete(request, gid):
    """商品信息删除"""
    try:
        ob = Goods.objects.get(id=gid)
        ob.delete()
        return redirect('/backstage/goods')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)
