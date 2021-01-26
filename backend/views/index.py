from django.shortcuts import redirect
from django.shortcuts import render
from django.urls import reverse
from common.models import Users
from common import base64

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
        pwd = request.POST['loginPassword']
        pwd = base64.base64_encode(pwd)
        if user.password == pwd:
            if user.state == 0:
                # 将当前登录信息以admin为key放入session
                request.session['admin'] = user.toDict()

                return redirect(reverse('backstage_index'))
            else:
                context = {'info': 'Your account is not admin account'}
        else:
            context = {'info': 'Incorrect username or password'}

        # md5密码验证
        # import hashlib
        # m = hashlib.md5()
        # m.update(bytes(request.POST['registerPassword'], encoding='utf-8'))
        # if user.password == m.hexdigest():
        #     pass
        # else:
        #     pass

    except Exception as err:
        context = {'info': 'Incorrect username or password'}
        print(err)
    return render(request, 'backend/login.html', context)


def logout(request):
    """退出登录"""
    del request.session['admin']
    return redirect(reverse('backstage_sign_in'))
