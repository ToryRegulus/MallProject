from django.shortcuts import render
from common.models import Users

# Create your views here.
def index(request):
    """会员信息主页"""
    user_list = Users.objects.all()
    context = {'userslist': user_list}
    return render(request, 'backstage/users/index.html', context)

def add(request):
    """添加会员信息"""
    return render(request, 'backstage/index.html')

def insert(request):
    """执行添加"""
    return render(request, 'backstage/index.html')

def edit(request):
    """修改会员信息"""
    return render(request, 'backstage/index.html')

def update(request):
    """执行修改"""
    return render(request, 'backstage/index.html')

def delete(request):
    """删除会员信息"""
    return render(request, 'backstage/index.html')
