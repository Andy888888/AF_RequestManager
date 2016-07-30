# AF_RequestManager
###### Base AFNetworking Core Network Request Framework

## 结构概览
    1.AbsApiDelegate
    1.BaseApiDelegate
    2.AbsApi
    3.BaseApi
    4.BaseServiceManager
    5.RequestManager

## 详解
    #### 1.｀AbsApiDelegate｀
    AbsApi的协议，规范了凡遵守该协议的Api对象都拥有｀getRootUrl｀,`getPath`,`getRespClass`方法。这种设计方式借鉴了Java，C#语法的Abstract抽象类
    





