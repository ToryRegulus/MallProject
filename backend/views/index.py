from django.shortcuts import redirect
from django.shortcuts import render
from django.urls import reverse
from backend.models import Users
import hashlib

# Create your views here.


def index(request):
    """网站后台主页面"""
    return render(request, 'backend/index.html')


def sign_in(request):
    """登录页面"""
    return render(request, 'backend/login.html')


def login(request):
    """执行登录"""
    try:
        user = Users.objects.get(username=request.POST['loginUsername'])

        # md5密码验证
        m = hashlib.md5()
        m.update(bytes(request.POST['loginPassword'], encoding='utf-8'))
        if user.password == m.hexdigest():
            if user.state == 0:
                # 将当前登录信息以admin为key放入session
                request.session['admin'] = user.toDict()

                return redirect(reverse('backstage_index'))
            else:
                context = {'info': 'Your account is not admin account'}
        else:
            context = {'info': 'Incorrect username or password'}
    except Exception as err:
        context = {'info': 'Incorrect username or password'}
        print(err)
    return render(request, 'backend/login.html', context)


def logout(request):
    """退出登录"""
    del request.session['admin']
    return redirect(reverse('backstage_sign_in'))
