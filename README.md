# SM3

国密算法sm3整合到iOS项目，因公司项目使用的openssl版本低于1.1.1，又不打算更新版本，但是需要用到sm3算法，所以单独抽出添加至项目

# 使用方式
```
NSString *str = @"abc";
NSData *data = [str sm3Data];//66c7f0f4 62eeedd9 d1f2d46b dc10e4e2 4167c487 5cf2f7a2 297da02b 8f4ba8e0
NSString *sm3 = [[str sm3] uppercaseString];//ZSFW9GLU7DNR8TRR3BDK4KFNXIDC8VEIKX2GK49LQOA=
```
