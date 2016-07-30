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
* `getRootUrl`用来配置请求域名`(不包括path)`,遵守者重写该方法需返回一个NSString对象；<br>
* `getPath`用来配置请求路径，遵守者重写该方法需返回一个NSString对象；`getRootUrl`和`getPath`拼接到一起才是一个完整的请求Url链接地址；<br>
* `getRespClass`用来指定该请求返回的数据实体Class，遵守者重写该方法需返回一个Class类型［Entity class］，将返回的数据转换成指定数据实体对象。同时在同一页面中发起n个不同api请求后，返回的数据，我们可以通过class来区别。<br><br><br>

### 2.BaseApiDelegate Protocal协议
BaseApi的协议，规范了凡遵守该协议的Api对象都拥有`getBaseHeader`,`getBaseBody`,`getRequestMethod`方法。这种设计方式借鉴了Java，C#语法的Interface接口的设计思想。<br>
* `getBaseHeader`用来配置请求http请求协议中的header（请求头），遵守者重写该方法需返回一个NSDictionary字典对象；<br>
* `getBaseBody`用来配置请求http请求协议中的请求体body，请求参数在这里设置，遵守者重写该方法需返回一个NSDictionary字典对象；<br>
* `getRequestMethod`用来配置该请求方式，目前设置了两种模式，用enum枚举RequestMethod来区分，可返回`RequestMethodPOST`（Post请求）或者`RequestMethodGET`（Get请求）,其他的请求方式后期补充。<br><br><br>

### 3.AbsApi abstract抽象类

### 4.BaseApi abstract抽象类

### 5.BaseServiceManager
用来使用AFNetWorking发送请求，只是个管理者，本身并不具备发送请求能力；目前依赖于AFNetWorking来发送网络请求；在内部封装了一些默认创建`AFHTTPSessionManager`的方法。
```Object-C
/// 使用block方式发送数据请求；api：发送参数，sucBlock：成功回调，failBlock：失败回调
- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           failBlock:(ResponseFailureBlock)failBlock;
```
该方法使用Block回调来发送请求，api参数为继承AbsApi抽象类，且遵守`BaseApiDelegate`协议的对象，`BaseServiceManager`内部通过api对象配置来发送请求。`sucBlock`，`failBlock`为请求成功／失败回调。<br><br><br>

### 6.RequestManager
继承自BaseServiceManager；设计此Manager主要目的是，后期不采用AFNetWorking时，可在本类的发送方法sendRequest...中切换其他第三方请求框架即可，而不需要项目中到处修改AFNetWorking请求为其他方式请求，同时担任着控制第三方请求的角色；因此，即使看不惯本类，也不要修改；另外，本类增加了Protocal回调数据方式请求。
    





