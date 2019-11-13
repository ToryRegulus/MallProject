from django.urls import path
from backstage.views import index, users

urlpatterns = [
    path('', index.index, name='backstage_index'),
    path('users/', users.index, name='backstage_users_index'),
    path('users/add', users.add, name='backstage_users_add'),
    path('users/insert', users.insert, name='backstage_users_insert'),
    path('users/edit/<int:uid>', users.edit, name='backstage_users_edit'),
    path(
        'users/update/<int:uid>', users.update, name='backstage_users_update'
        ),
    path('users/del/<int:uid>', users.delete, name='backstage_users_del'),
]
