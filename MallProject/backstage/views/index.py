from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, 'backstage/index.html')      # 网站后台主页面
