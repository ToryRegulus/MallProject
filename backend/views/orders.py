from django.shortcuts import render
from django.db.models import Q
from django.core.paginator import Paginator

from common.models import Goods, Users, Orders, Detail


def index(request):
    """浏览信息"""
    # 获取订单信息
    order_mod = Orders.objects
    mywhere = []

    # 获取、判断并封装关keyword键搜索
    kw = request.GET.get('keyword', None)
    if kw:
        # 查询收件人和地址中只要含有关键字的都可以
        order_list = order_mod.filter(Q(linkman_contains=kw) | Q(address__contains=kw))
        mywhere.append('keyword=' + kw)
    else:
        order_list = order_mod.filter()

    # 获取、判断并封装订单状态state搜索条件
    order_state = request.GET.get('state', '')
    if order_state != '':
        order_list = order_list.filter(state=order_state)
        mywhere.append('state=' + order_state)

    # 实现分页功能
    paginator = Paginator(order_list, 10)  # 实例化Paginator, 每页显示10条数据
    page = request.GET.get('page', 1)
    pag = paginator.page(page)

    # 遍历订单信息并追加下订单人姓名信息
    for od in pag:
        user = Users.objects.only('name').get(id=od.uid)
        od.name = user.name

    context = {'orders_list': pag, 'mywhere': mywhere}
    return render(request, 'backend/orders/index.html', context)


def detail(request, oid):
    """订单详情信息"""
    try:
        # 加载订单信息
        orders = Orders.objects.get(id=oid)
        if orders is not None:
            user = Users.objects.only('name').get(id=orders.uid)
            orders.name = user.name

        # 加载订单详情
        dlist = Detail.objects.filter(orderid=oid)
        # 遍历每个商品详情，从Goods中获取对应的图片
        for og in dlist:
            og.picname = Goods.objects.only('picname').get(
                id=og.goodsid).picname

        # 放置模板变量，加载模板并输出
        context = {'orders': orders, 'detaillist': dlist}
        return render(request, 'backend/orders/detail.html', context)
    except Exception as err:
        print(err)
        context = {'info': '没有找到要查看的信息！'}
    return render(request, 'backend/info.html', context)


def state(request):
    """修改订单状态"""
    try:
        oid = request.GET.get('oid', '0')
        ob = Orders.objects.get(id=oid)
        ob.state = request.GET['state']
        ob.save()
        context = {'info': '修改成功！'}
    except Exception as err:
        print(err)
        context = {'info': '修改失败！'}
    return render(request, 'backend/info.html', context)
