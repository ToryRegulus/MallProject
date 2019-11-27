from django.urls import path
from web.views import index, cart, orders


urlpatterns = [
    # 前台主页路由
    path('', index.index, name='web_index'),
    path('list', index.lists, name='web_list'),
    path('list/<int:pIndex>', index.lists, name='web_list'),
    path('detail/<int:gid>', index.detail, name='web_detail'),

    # 会员中心路由
    path('sign_in', index.sign_in, name='web_sign_in'),
    path('login', index.login, name='web_login'),
    path('sign_out', index.sign_out, name='web_sign_out'),
    path('register', index.register, name='web_register'),
    path('regist', index.regist, name='web_regist'),

    # 购物车路由
    path('cart', cart.index, name='cart_index'),
    path('cart/add/<int:gid>', cart.add, name='cart_add'),
    path('cart/del/<int:gid>', cart.delete, name='cart_del'),
    path('cart/clear', cart.clear, name='cart_clear'),
    path('cart/change', cart.change, name='cart_change'),

    # 订单处理
    path('orders/add', orders.add, name='orders_add'),
    path('orders/confirm', orders.confirm, name='orders_confirm'),
    path('orders/insert', orders.insert, name='orders_insert'),
]
