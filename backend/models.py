from django.db import models
from datetime import datetime


# Create your models here.
class Users(models.Model):
    """用户信息模型"""
    username = models.CharField(max_length=32)  # 昵称
    name = models.CharField(max_length=16)  # 真实姓名
    password = models.CharField(max_length=32)  # 密码
    sex = models.IntegerField(default=1)  # 性别（1，0代替男女）
    address = models.CharField(max_length=255)  # 收货地址
    code = models.CharField(max_length=6)  # 邮编
    phone = models.CharField(max_length=16)  # 电话号码
    email = models.CharField(max_length=50)  # 电子邮箱
    state = models.IntegerField(default=1)  # 会员状态（1：启用，2：禁用，0：管理员）
    addtime = models.DateTimeField(default=datetime.now)  # 会员注册时间

    def toDict(self):
        return {
            'id': self.id,
            'username': self.username,
            'name': self.name,
            'password': self.password,
            'address': self.address,
            'phone': self.phone,
            'email': self.email,
            'code': self.code,
            'state': self.state,
        }

    class Meta:
        db_table = 'users'  # 指定数据库表名（默认common_users)
        ordering = ['id']  # 模型按ID排序


class Types(models.Model):
    """商品类别模型"""
    name = models.CharField(max_length=32)  # 类别名称
    pid = models.IntegerField(default=0)  # 父类别路径
    path = models.CharField(max_length=255)  # 路径

    class Meta:
        db_table = 'type'


class Goods(models.Model):
    """商品信息模型"""
    typeid = models.IntegerField()  # 商品类别ID
    goods = models.CharField(max_length=32)     # 商品名
    company = models.CharField(max_length=50)   # 厂家
    content = models.TextField()    # 商品介绍
    price = models.FloatField()     # 单价
    picname = models.CharField(max_length=255)  # 图片名
    store = models.IntegerField(default=0)      # 库存
    num = models.IntegerField(default=0)        # 数量
    clicknum = models.IntegerField(default=0)   # 点击量
    state = models.IntegerField(default=1)      # 状态（1：新商品，2：在售，3：已下架）
    addtime = models.DateTimeField(default=datetime.now)

    def toDict(self):
        return {
            'id': self.id,
            'typeid': self.typeid,
            'goods': self.goods,
            'company': self.company,
            'price': self.price,
            'picname': self.picname,
            'store': self.store,
            'num': self.num,
            'clicknum': self.clicknum,
            'state': self.state
        }

    class Meta:
        db_table = 'goods'


class Orders(models.Model):
    """订单模型"""
    uid = models.IntegerField()  # 下单者ID
    linkman = models.CharField(max_length=32)       # 下单者名称
    address = models.CharField(max_length=255)      # 地址
    code = models.CharField(max_length=6)           # 邮编
    phone = models.CharField(max_length=16)         # 联系电话
    addtime = models.DateTimeField(default=datetime.now)    # 添加时间
    total = models.FloatField()     # 总金额
    state = models.IntegerField()   # 订单状态（0.待发货，1.已发货，2。已完成，3.无效订单）

    class Meta:
        db_table = 'orders'  # 更改表名


class Detail(models.Model):
    """订单详情模型"""
    orderid = models.IntegerField()     # 订单ID
    goodsid = models.IntegerField()     # 商品ID
    name = models.CharField(max_length=32)      # 商品名
    price = models.FloatField()     # 价格
    num = models.IntegerField()     # 购买数量

    class Meta:
        db_table = 'detail'  # 更改表名
