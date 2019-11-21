from django.shortcuts import render

# Create your views here.


def index(request):
    """商品首页"""
    return render(request, 'web/index.html')


def lists(request, pindex=1):
    """商品列表页"""
    return render(request, 'web/list.html')


def detail(request, gid):
    """商品详情页"""
    return render(request, 'web/detail.html')
