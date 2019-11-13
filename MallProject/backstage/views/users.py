from django.shortcuts import render
from common.models import Users
from datetime import datetime

# Create your views here.


def index(request):
    """会员信息主页"""
    user_list = Users.objects.all()
    context = {'userslist': user_list}
    return render(request, 'backstage/users/index.html', context)


def add(request):
    """添加会员信息"""
    return render(request, 'backstage/users/add.html')


def insert(request):
    """执行添加"""
    try:
        ob = Users()
        ob.username = request.POST['registerUsername']
        ob.password = request.POST['registerPassword']
        ob.sex = request.POST['gender']
        ob.name = request.POST['registerName']
        ob.email = request.POST['registerEmail']
        ob.phone = request.POST['registerPhone']
        ob.address = request.POST['registerAddress']
        ob.code = request.POST['registerZip']
        ob.state = 1
        ob.addtime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        ob.save()
        context = {'info': 'Addition Success'}
    except Exception as err:
        print(err)
        context = {'info': 'Addition Failed'}
    return render(request, 'backstage/info.html', context)


def edit(request):
    """修改会员信息"""
    pass


def update(request):
    """执行修改"""
    pass


def delete(request):
    """删除会员信息"""
    pass
