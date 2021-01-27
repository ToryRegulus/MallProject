from django.shortcuts import redirect
from django.urls import reverse
import re


class ShopMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # 不被中间件拦截的URL
        pass_url = [
            '/backend/sign_in',
            '/backend/login',
            '/backend/sign_out',
        ]

        # 获取当前请求路径
        path = request.path

        # 判断用户登录，否则跳转登录页
        if re.match('/backend', path) and (path not in pass_url):
            if 'admin' not in request.session:
                return redirect(reverse('backstage_sign_in'))

        if re.match('/orders', path) or re.match('/vip', path):
            if 'user' not in request.session:
                return redirect(reverse('web_sign_in'))

        response = self.get_response(request)
        return response
