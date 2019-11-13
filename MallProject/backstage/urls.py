from django.urls import path
from backstage.views import index, users

urlpatterns = [
    path('', index.index, name='backstage_index'),                              # 后台首页
    path('users/', users.index, name='backstage_users_index'),                   # 会员信息主页
    path('users/add', users.add, name='backstage_users_add'),                    # 添加会员信息
    path('users/insert', users.insert, name='backstage_users_insert'),           # 执行添加
    path('users/edit/<int:uid>', users.edit, name='backstage_users_edit'),       # 修改会员信息
    path('users/update/<int:uid>', users.update, name='backstage_users_update'), # 执行修改
    path('users/del/<int:uid>', users.delete, name='backstage_users_del'),       # 删除会员信息
]
