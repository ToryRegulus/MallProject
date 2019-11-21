from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from common.models import Users
from django.db.models import Q
from datetime import datetime
from .. import base64

# Create your views here.


def index(request):
    """会员信息主页"""
    umod = Users.objects
    mywhere = []

    # 获取、判断并封装关keyword键搜索
    kw = request.GET.get('keyword', None)
    if kw:
        # 查询账户或真实姓名中只要含有关键字的都可以
        user_list = umod.filter(
            Q(username__contains=kw) | Q(name__contains=kw))
        mywhere.append('keyword=' + kw)
    else:
        user_list = umod.filter()
    # 获取、判断并封装性别sex搜索条件
    sex = request.GET.get('sex', '')
    if sex != '':
        user_list = user_list.filter(sex=sex)
        mywhere.append('sex=' + sex)

    # 实现分页功能
    paginator = Paginator(user_list, 10)  # 实例化Paginator, 每页显示3条数据
    page = request.GET.get('page', 1)
    Pag = paginator.page(page)

    context = {'userslist': Pag, 'mywhere': mywhere}
    return render(request, 'backstage/users/index.html', context)


def add(request):
    """添加会员信息"""
    return render(request, 'backstage/users/add.html')


def insert(request):
    """执行添加"""
    try:
        ob = Users()  # 实例化Users模型
        ob.username = request.POST['registerUsername']

        # 密码base64加密
        pwd = request.POST['registerPassword']
        pwd = base64.base64_encode(pwd)
        ob.password = pwd

        # 密码md5加密
        # import hashlib
        # m = hashlib.md5()
        # m.update(bytes(request.POST['registerPassword'], encoding='utf-8'))
        # ob.password = m.hexdigest()

        ob.sex = request.POST['gender']
        ob.name = request.POST['registerName']
        ob.email = request.POST['registerEmail']
        ob.phone = request.POST['registerPhone']
        ob.address = request.POST['registerAddress']
        ob.code = request.POST['registerZip']
        ob.state = 1
        ob.addtime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        ob.save()  # 将数据存储至数据库
        return redirect('/backstage/users')
    except Exception as err:
        print(err)
        context = {'Info': 'Addition Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def edit(request, uid):
    """修改会员信息"""
    try:
        ob = Users.objects.get(id=uid)
        context = {'user': ob}
        return render(request, 'backstage/users/edit.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def update(request, uid):
    """执行修改"""
    try:
        ob = Users.objects.get(id=uid)
        ob.sex = request.POST['gender']
        ob.name = request.POST['registerName']
        ob.email = request.POST['registerEmail']
        ob.phone = request.POST['registerPhone']
        ob.address = request.POST['registerAddress']
        ob.code = request.POST['registerZip']
        ob.state = request.POST['status']
        ob.save()
        return redirect('/backstage/users')
    except Exception as err:
        print(err)
        context = {'Info': 'Edit Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def delete(request, uid):
    """删除会员信息"""
    try:
        ob = Users.objects.get(id=uid)
        ob.delete()
        return redirect('/backstage/users')
    except Exception as err:
        print(err)
        context = {'Info': 'Delete Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def resetpwd(request, uid):
    """修改会员密码"""
    try:
        ob = Users.objects.get(id=uid)
        context = {'user': ob}
        return render(request, 'backstage/users/resetpwd.html', context)
    except Exception as err:
        print(err)
        context = {'Info': 'Cannnot fetch the page', 'Detail': err}
        return render(request, 'backstage/info.html', context)


def do_reset(request, uid):
    """提交修改密码"""
    try:
        ob = Users.objects.get(id=uid)

        # 密码base64加密
        pwd = request.POST['registerPassword']
        pwd = base64.base64_encode(pwd)
        ob.password = pwd

        ob.save()
        return redirect('/backstage/users')
    except Exception as err:
        print(err)
        context = {'Info': 'Reset Password Failed', 'Detail': err}
        return render(request, 'backstage/info.html', context)
