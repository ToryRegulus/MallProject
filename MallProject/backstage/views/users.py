from django.shortcuts import render
from common.models import Users
from datetime import datetime
from .. import base64

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
        ob = Users()    # 实例化Users模型
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
        ob.save()   # 将数据存储至数据库
        context = {'Info': 'Addition Success', 'Detail': 'None'}
    except Exception as err:
        print(err)
        context = {'Info': 'Addition Failed', 'Detail': err}
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
