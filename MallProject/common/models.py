from django.db import models
from datetime import datetime

# Create your models here.
class Users(models.Model):
    """用户信息模型"""
    username = models.CharField(max_length=32)      # 昵称
    name = models.CharField(max_length=16)          # 真实姓名
    password = models.CharField(max_length=32)      # 密码
    sex = models.IntegerField(default=1)            # 性别（1，0代替男女）
    address = models.CharField(max_length=255)      # 收货地址
    code = models.CharField(max_length=6)           # 邮编
    phone = models.CharField(max_length=16)         # 电话号码
    email = models.CharField(max_length=50)         # 电子邮箱
    state = models.IntegerField(default=1)          # 会员状态
    addtime = models.DateTimeField(default=datetime.now)    # 会员注册时间
    
    def toDict(self):
        return {
            'username':self.username,
            'name':self.name,
            'password':self.password,
            'address':self.address,
            'phone':self.phone,
            'email':self.email,
            'state':self.state,
            'addtime':self.addtime
        }


    class Meta:
        db_table = 'users'      # 指定数据库表名（默认common_users)
