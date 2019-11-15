from django.shortcuts import redirect
from django.urls import reverse
import re


class ShopMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # 不被中间件拦截的URL
        pass_url = [
            '/backstage/sign_in',
            '/backstage/login',
            '/backstage/logout',
        ]

        # 获取当前请求路径
        path = request.path

        # 判断用户登录，否则跳转登录页
        if re.match('/backstage', path) and (path not in pass_url):
            if 'admin' not in request.session:
                return redirect(reverse('backstage_sign_in'))

        response = self.get_response(request)
        return response
