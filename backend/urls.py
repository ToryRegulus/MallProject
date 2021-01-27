from backend.views import index, users, types, goods, orders
from django.urls import path

urlpatterns = [
    path('', index.index, name='IndexBE'),

    # 后台管理员路由
    path('sign_in', index.sign_in, name='SignInBE'),
    path('login', index.login, name='LoginBE'),
    path('sign_out', index.logout, name='SignOutBE'),

    # 会员信息管理路由
    path('users', users.index, name='UserIndexBE'),
    path('users/add', users.add, name='UserAddBE'),
    path('users/insert', users.insert, name='UserInsertBE'),
    path('users/edit/<int:uid>', users.edit, name='UserEditBE'),
    path('users/update/<int:uid>', users.update, name='UserUpdateBE'),
    path('users/del/<int:uid>', users.delete, name='UserDelBE'),
    path('users/resetpwd/<int:uid>', users.resetpwd, name='UserResetPWDBE'),
    path('users/reset/<int:uid>', users.do_reset, name='UserResetBE'),

    # 后台商品目录路由
    path('types', types.index, name='TypeIndexBE'),
    path('types/add/<int:tid>', types.add, name='TypeAddBE'),
    path('types/insert', types.insert, name='TypeInsertBE'),
    path('types/edit/<int:tid>', types.edit, name='TypeEditBE'),
    path('types/update/<int:tid>', types.update, name='TypeUpdateBE'),
    path('types/del/<int:tid>', types.delete, name='TypeDelBE'),

    # 商品信息管理路由
    path('goods', goods.index, name='GoodsIndexBE'),
    path('goods/add', goods.add, name='GoodsAddBE'),
    path('goods/insert', goods.insert, name='GoodsInsertBE'),
    path('goods/edit/<int:gid>', goods.edit, name='GoodsEditBE'),
    path('goods/update/<int:gid>', goods.update, name='GoodsUpdateBE'),
    path('goods/del/<int:gid>', goods.delete, name='GoodsDelBE'),

    # 订单管理
    path('orders', orders.index, name='OrderIndexBE'),
    path('orders/detail/<int:oid>', orders.detail, name='OrderDetailBE'),
    path('orders/state', orders.state, name='OrderStateBE'),
]
