from django.urls import path
from backstage.views import index

urlpatterns = [
    path('', index.index, name='backstage_index'),      # 后台首页
]
