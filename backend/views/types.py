from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from common.models import Types


def index(request):
    """商品类别主页"""
    type_list = Types.objects.extra(select={
        'path_id': 'concat(path, id)'
    }).order_by('path_id')

    # 实现类别缩进
    for ob in type_list:
        ob.pname = '. . . ' * (ob.path.count(',') - 1)

    # 实现分页功能
    paginator = Paginator(type_list, 10)  # 实例化Paginator, 每页显示3条数据
    page = request.GET.get('page', 1)
    Pag = paginator.page(page)

    context = {'typeslist': Pag}
    return render(request, 'backend/types/index.html', context)


def add(request, tid):
    """添加商品类别"""
    # 获取父类别信息
    if tid == 0:
        context = {'pid': 0, 'path': '0,', 'name': '根类别'}
    else:
        ob = Types.objects.get(id=tid)
        context = {
            'pid': ob.id,
            'path': ob.path + str(ob.id) + ",",
            'name': ob.name
        }
    return render(request, "backend/types/add.html", context)


def insert(request):
    """执行添加"""
    try:
        ob = Types()
        ob.name = request.POST['categoryName']
        ob.pid = request.POST['PID']
        ob.path = request.POST['PATH']
        ob.save()
        return redirect('/backend/types')
    except Exception as err:
        print(err)
        context = {'Info': 'Addition Failed', 'Detail': err}
        return render(request, 'backend/info.html', context)


def edit(request, tid):
    """修改商品类别"""
    try:
        ob = Types.objects.get(id=tid)
        context = {'type': ob}
        return render(request, 'backend/types/edit.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backend/info.html', context)


def update(request, tid):
    """执行修改"""
    try:
        ob = Types.objects.get(id=tid)
        ob.name = request.POST['categoryName']
        ob.save()
        return redirect('/backend/types')
    except Exception as err:
        print(err)
        context = {'Info': 'Edit Failed', 'Detail': err}
        return render(request, 'backend/info.html', context)


def delete(request, tid):
    """删除商品类别"""
    try:
        ob = Types.objects.get(id=tid)

        # 若父类别含有子类别则不能删除
        if Types.objects.filter(pid=tid):       # 使用filter获取多条数据
            context = {
                'Info':
                'This category contains subcategory and cannot be removed'
            }
            return render(request, 'backend/info.html', context)
        else:
            ob.delete()

        return redirect('/backend/types')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backend/info.html', context)
