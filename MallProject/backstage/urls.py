from backstage.views import index, users, types
from django.urls import path

urlpatterns = [
    path('', index.index, name='backstage_index'),

    # 后台管理员路由
    path('sign_in', index.sign_in, name='backstage_sign_in'),
    path('login', index.login, name='backstage_login'),
    path('logout', index.logout, name='backstage_sign_out'),

    # 会员信息管理路由
    path('users', users.index, name='backstage_users_index'),
    path('users/add', users.add, name='backstage_users_add'),
    path('users/insert', users.insert, name='backstage_users_insert'),
    path('users/edit/<int:uid>', users.edit, name='backstage_users_edit'),
    path('users/update/<int:uid>', users.update,
         name='backstage_users_update'),
    path('users/del/<int:uid>', users.delete, name='backstage_users_del'),

    # 后台商品信息路由
    path('types', types.index, name='backstage_types_index'),
    path('types/add/<int:tid>', types.add, name='backstage_types_add'),
    path('types/insert', types.insert, name='backstage_types_insert'),
    path('types/edit/<int:tid>', types.edit, name='backstage_types_edit'),
    path('types/update/<int:tid>', types.update,
         name='backstage_types_update'),
    path('types/del/<int:tid>', types.delete, name='backstage_types_del'),
]
