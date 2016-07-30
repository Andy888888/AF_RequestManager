# AF_RequestManager
###### Base AFNetworking Core Network Request Framework

## 结构概览
    1.AbsApiDelegate
    2.BaseApiDelegate
    3.AbsApi
    4.BaseApi
    5.BaseServiceManager
    6.RequestManager

## 详解
### 1.AbsApiDelegate Protocal协议
AbsApi的协议，规范了凡遵守该协议的Api对象都拥有`getRootUrl`,`getPath`,`getRespClass`方法。这种设计方式借鉴了Java，C#语法的Interface接口的设计思想。<br>
`getRootUrl`用来配置请求域名`(不包括path)`,遵守者重写该方法需返回一个NSString对象；<br>
`getPath`用来配置请求路径，遵守者重写该方法需返回一个NSString对象；`getRootUrl`和`getPath`拼接到一起才是一个完整的请求Url链接地址；<br>
`getRespClass`用来指定该请求返回的数据实体Class，遵守者重写该方法需返回一个Class类型［Entity class］，将返回的数据转换成指定数据实体对象。同时在同一页面中发起n个不同api请求后，返回的数据，我们可以通过class来区别。<br><br>

### 2.BaseApiDelegate Protocal协议
BaseApi的协议，规范了凡遵守该协议的Api对象都拥有`getBaseHeader`,`getBaseBody`,`getRequestMethod`方法。这种设计方式借鉴了Java，C#语法的Interface接口的设计思想。<br>
`getBaseHeader`用来配置请求http请求协议中的header（请求头），遵守者重写该方法需返回一个NSDictionary字典对象；<br>
`getBaseBody`用来配置请求http请求协议中的请求体body，请求参数在这里设置，遵守者重写该方法需返回一个NSDictionary字典对象；<br>
`getRequestMethod`用来配置该请求方式，目前设置了两种模式，用enum枚举RequestMethod来区分，可返回`RequestMethodPOST`（Post请求）或者`RequestMethodGET`（Get请求）,其他的请求方式后期补充。
    





