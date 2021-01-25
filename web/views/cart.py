from django.shortcuts import render, redirect, reverse
from common.models import Types, Goods


def load_info(request):
    """公共信息加载函数"""
    lists = Types.objects.filter(pid=0)
    context = {'typelist': lists}
    return context


def index(request):
    """购物车首页"""
    context = load_info(request)
    if 'shoplist' not in request.session:
        request.session['shoplist'] = {}
    return render(request, 'web/cart.html', context)


def add(request, gid):
    """购物车添加"""
    shop = Goods.objects.get(id=gid).toDict()
    shop['m'] = int(request.POST.get('m', 1))
    shoplist = request.session.get('shoplist', {})

    # 判断购物车中是否已存在购买商品
    gid = str(gid)
    if gid in shoplist:
        shoplist[gid]['m'] += shop['m']
    else:
        shoplist[gid] = shop

    request.session['shoplist'] = shoplist
    return redirect(reverse('cart_index'))


def delete(request, gid):
    """购物车删除"""
    shoplist = request.session['shoplist']
    del shoplist[str(gid)]
    request.session['shoplist'] = shoplist
    return redirect(reverse('cart_index'))


def clear(request):
    """购物车清空"""
    request.session['shoplist'] = {}
    return redirect(reverse('cart_index'))


def change(request):
    """购物车添加商品"""
    shoplist = request.session['shoplist']
    shopid = request.GET.get('gid', 0)
    num = int(request.GET.get('num', 1))
    if num < 1:
        num = 1
    shoplist[shopid]['m'] = num
    request.session['shoplist'] = shoplist
    return redirect(reverse('cart_index'))
