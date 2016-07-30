# AF_RequestManager
###### Base AFNetworking Core Network Request Framework
![Logo](https://raw.githubusercontent.com/Andy888888/AF_RequestManager/master/AF_RequestManager/Assets.xcassets/AppIcon.appiconset/network_58.png "AF_RequestManager 图标")<br><br>


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
请求抽象类，遵守了`AbsApiDelegate`协议，标识凡继承AbsApi的对象都拥有`getRootUrl`和 `getPath`方法<br>
内部添加了`getReqUrl`和`getTimeOut`方法。分别用来返回一个完整的请求Url地址，和返回超时时间。<br><br><br>


### 4.BaseApi abstract抽象类
请求基类，遵守了`BaseApiDelegate`协议，标识凡继承AbsApi的对象都拥有`getBaseHeader`, `getBaseBody`和`getRequestMethod`方法。
目前内部只是实现了`getRequestMethod`方法默认采用Post`(RequestMethodPOST)`请求方式。<br><br><br>

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
```Object-C
/// ResponseDelegate 数据响应回调协议
@property (nonatomic,assign) id<ResponseDelegate> delegate;

+ (id)initManagerWithDelegate:(id<ResponseDelegate>)delegate;
/// 发送数据请求，参数为继承AbsApi抽象类，且遵守BaseApiDelegate协议 的对象
- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api;
```
我们可以直接使用`initManagerWithDelegate:`方法来初始化RequestManager对象，将数据回调协议delegate传入。<br>
使用`sendRequest:`方法来发送请求，同父类一致，api参数为继承AbsApi抽象类，且遵守`BaseApiDelegate`协议的对象。而上述`BaseApi`就符合这一点，而BaseApi如果不符合你的口味，你可以来自定义一个继承AbsApi又遵守BaseApiDelegate协议的对象。
    





