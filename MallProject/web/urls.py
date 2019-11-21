from django.urls import path
from web.views import index

urlpatterns = [
    path('', index.index, name='web_index'),            # 前台首页
    path('list/', index.lists, name='web_list'),        # 商品列表
    path('detail/', index.detail, name='web_detail'),   # 商品详情
]
