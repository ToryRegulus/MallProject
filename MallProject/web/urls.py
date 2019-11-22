from django.urls import path
from web.views import index

urlpatterns = [
    # 前台主页路由
    path('', index.index, name='web_index'),
    path('list', index.lists, name='web_list'),
    path('detail/<int:gid>', index.detail, name='web_detail'),

    # 会员中心路由
    path('sign_in', index.sign_in, name='web_sign_in'),
    path('login', index.login, name='web_login'),
    path('sign_out', index.sign_out, name='web_sign_out'),
    path('register', index.register, name='web_register'),
    path('regist', index.regist, name='web_regist'),
]
