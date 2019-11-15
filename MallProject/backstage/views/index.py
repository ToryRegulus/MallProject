from django.shortcuts import render

# Create your views here.


def index(request):
    """网站后台主页面"""
    return render(request, 'backstage/index.html')


def sign_in(request):
    """登录页面"""
    return render(request, 'backstage/login.html')


def login(request):
    """执行登录"""
    pass


def logout(request):
    """退出登录"""
    pass
