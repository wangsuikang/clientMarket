//
//  Const.h
//  zizhubao
//
//  Created by ZW on 3/26/14.
//  Copyright (c) 2014 zgcrichard. All rights reserved.
//

#ifndef zizhubao_Const_h
#define zizhubao_Const_h



BOOL   isNewFlow;    //是否在新流程界面；
int    requestIP;    //IP请求地址
enum
{
    requestTestIP = 1, //测试环境
    requestOnlineIP,   //生产环境
    requestDebugIp     // 开发环境
};

enum
{
    InsuretData = 1, // 报价投网页所需的json数据
    SelfserviceData,  // 自助投网页所需的json数据
    nullData
};
int dataType;        //网页传json数据的类型
enum
{
    alertViewName = 1, //报价投输入用户姓名
    alertViewidNo,      //报价投输入用户id
    alertViewTestCode   //验证码
};
int alertViewType;     //自定义输入框的类型

enum
{
    urlTypeSelfService = 1, // 自助投
    urlTypeInsurtNew,       // 新保
    urlTypeInsurtOld        // 续保
};
int httpURLType;       //网页URL类型

typedef enum
{
    RESETPW   = 1, //修改密码（无密保问题)
    SETQUE,     //设置密保问题
    ANSWERQUE   //回答密保问题
}QueType;

typedef enum
{
    UserRegister = 1,//注册
    UserLogin,//登录
    UserLogout,//退出登录
    SaveScore,//保存万里通积分
    GetPassword,//找回密码
    ModPassword,//修改密码
    VersionUpdate,//版本更新
    shareMessage,//获取分享文本
    SelfPayMessage,//用户支付发短信
    OrderMessage,//支付发短信
    GenerateCode,//短信验证码
    MyScore,//我的积分
    MateyIncome,//好友收入
    OrderFromList,//订单列表
    OrderFromInfo,//订单详情
    MessageList,//消息中心
    mainScrollPic,//宣导图
    ShareGetScore,//分享成功送积分
    OrderDetailPay,//订单详情支付
    QueryScore,//查询万里通积分
    ComfirmToken, //确认收到服务器返回的token
    SaveSaleAgnetID,//保存业务员ID调用接口
    SelectSaleAgnetInfo,//查询业务员信息
    PriceHistoryList,//报价历史列表接口
    PriceHistoryDetail,//报价历史详情接口
    SelectUserPrice,//查询用户暂存报价数据
    GetWebtrendsSwitch,//查询后台webtrends开关
    SignUpEveryDay,    //每日签到
    CollectUserInfo,    //收集用户设备信息
    CreateOrcode,        //生成二维码
    CreateQrcodeUrl,     //生成二维码地址
    FAQhtmlUrl,       // FAQ HTML地址
    GETScoreList,
    GETScorePermission,
    GETCityAll,
    SearchCity,
    UnderLineStatus,      //下线订单开关
    UnderLineOrder,       //下线订单
    GetPdfParam,          //获得PDF参数
    GetPdfPath,           //获得PDF路径
    GetOrderStatus,       //打印订单开关
    GetPrintOrderList,    //订单打印列表接口
    GetTotalUser,         //当月活动用户  累计活跃用户  未活跃用户
    GetActiveUser,        //用户活动详情列表
    
    
}RequestType;

typedef enum {
    ReqURLRegister = 1,//注册
    ReqURLLogin,//登录
    ReqURLLogOut,//退出登录
    ReqURLSaveScore,//保存万里通积分
    ReqURLGetPwd,//找回密码
    ReqURLModifyPwd,//修改密码
    ReqURLVersionUpdate,//版本更新
    ReqURLShareText,//分享文本
    ReqURLUserPaySendMsgNote,//用户自付发短信
    ReqURLPaySendMsgNote,//支付发短信
    ReqURLGetVeriticationCode,//验证码接口
    ReqURLMyAccountScore,//我的积分账户接口
    ReqURLFriendAccountScore,  //好友积分收益
    ReqURLOrderList,           //订单列表接口
    ReqURLOrderDetail,         //订单详情接口
    ReqURLMymessage,           //我的消息列表接口
    ReqURLSelfServe,           //自助投URL
    ReqURLMainRecPic,          //首页宣导图
    ReqURLShareGetScore,       //分享成功送积分
    ReqURLOrderDetailPay,      //订单详情支付
    ReqURLQueryScore,          //查询万里通积分
    ReqURLComfirmToken,        //确认收到服务器返回的token
    ReqURLSaveSaleAgnetID,     //保存业务员ID请求类型
    ReqURLSelectSaleAgnetInfo, //查询业务员信息
    ReqURLPriceHistoryList,    //报价历史列表接口
    ReqURLPriceHistoryDetail,  //报价历史详情接口
    ReqURLSelectUserPrice,     //查询用户暂存报价数据
    ReqURLGetWebtrendsSwitch,  //查询后台webtrends开关
    ReqURLSignUpEveryDay,      //每日签到
    ReqURLCollectUserInfo,     //收集用户设备信息
    ReqURLCreateOrcode,        //生成二维码
    ReqURLCreateQrcodeUrl,     //生成二维码地址接口
    ReqURLFAQhtmlUrl,          // FAQ HTML地址
    ReqURLFrameNumberUrl,      //车架号带出车品牌号
    reqURLIntegralUrl,         //积分请求
    reqURLSubmitApply,         //提交申请请求
    reqURLPermissionUrl,       //判断积分显示的权限请求
    reqURLForthCity,           //城市四级机构
    reqURLSearchForthCity,     //城市司机机构搜索
    reqURLGetScoreDetail,      //积分详情
    reqURLUnderLineOrder,      //下线订单
    reqURLOrderStatus,         //下线订单的开关接口
    ReqURLGetPdfParam,         //获得PDF参数
    ReqURLGetPdfPath,          //获得PDF路径
    ReqURLGetPrintStatus,      //移动打单开关接口
    ReqURLGetPrintList,        //移动打单列表接口
    ReqDownLineUserAnalysis,   //获取用户按等级分析统计
    ReqURLGetAnalysisByPartner,// 按合作商统计接口
    ReqURLOrderApply,          //去投保的连接
    ReqURLGetNoCarPolicyOrderList, //获取非车保单
    ReqURLGetNoCarApplyList,   //获取非车投保单
    ReqURLGetNoCarOrderDetail, //获取非车订单详情
    ReqURLGetTestCode,         //获取江苏监管机构的验证码
    ReqURLGetCheckTestCode,    //验证验证码接口
    ReqURLGetQrcode,           //获取分享二维码
    ReqURLGetQrcodeUrl,        //获取分享二维码的连接
    ReqURLShareQrcode,         //分享接口
    ReqURLElectronInsureOrder, //电子保单接口
    ReqURLSelectWillOverCustomer,//即将过期的用户
    ReqURLSelectCustomer,      //搜索客户
    ReqURLHardCustomer,        //困难件详情接口
    ReqURLNeighbourCustomer,   //周边车主
    ReqURLRobOrder,            //抢单接口
    ReqURLSkyHelp,             //空中支援
    ReqURLAddCustomer,         //添加用户接口
    ReqURLCustomerDetail,      //用户详情接口
    ReqURLFirstPageCoverImage, //首页遮罩图片
}   RequestURL;


//自助投请求接口
typedef enum {
    Renewal_check = 1,//续保检查
    InfoQuery,//监管信息查询
    SaveQueryInfo,//保存报价信息
    ToQueryInfo,//自助投首页请求
    CarSelect,  //车型选择
    CarSearch   //车型搜索
}selfRequestType;

//自助投请求接口
typedef enum {
    ReqURLrenewal_check = 1,//续保检查
    ReqURLInfoQuery,//监管信息查询
    ReqURLSaveQueryInfo,//保存报价信息
    ReqURLtoQueryInfo,//自助投首页请求
    ReqURLCarSelect,  //车型选择
    ReqURLCarSearch   //车型搜索
}selfRequestURL;

typedef enum {
    InfoStatusFirstTimeSetting = 0,//第一次设置
    InfoStatusConfirmSetting,//确认设置
    InfoStatusFailedConfirm,//确认失败
    InfoStatusNormal,//正常状态
    InfoStatusFailedMatch,//匹配失败
    InfoStatusSuccessMatch//匹配成功
}	InfoStatus;//设置手势密码状态

typedef enum {
    none = 0,     //自己进入自助投首页
    popFromWeb    //从web退回到自助投首页
}selfRequestPopType;
int selfpopType;

//typedef enum {
//    sourceTypeHaohuoban = 0,//来源于好伙伴
//    sourceTypeZizhubao//来源于自助保
//}MediaSource;//媒体来源

typedef enum {
    Local = 0,
    SandBox
}	dataBaseState;

BOOL registerScuess;
int  RequestState;
BOOL isfromAnswerview;
int  viewType;//密保的类型

int  DBType;
BOOL firstEnterFriend;

int SearchType;
enum
{
    BrandName = 1,
    EngineDesc,
    FamilyName,
    VehicleCode,
    GearboxName,
    VehicleType
}carSelectType;

//requestRealmPa18   = 1, //网销系统域名
//接口请求的系统，以此来判断域名
enum
{
    requestRealmPa18   = 1, //网销系统域名
    requestRealmOneAccount,      //一账通系统域名
    requestMember,               //会员系统域名
    requestNotcar                //飞车系统域名
};
int requestRealmType;


int eachSelected;
//车型选择在确定前选择的具体选项
enum
{
    BRANDSELECTED = 1,
    FAMILYSELECTED,
    ENGINESELECTED,
    GEARBOXNAMESELECTED,
    VEHICLECODESELECTED,
    VEHICLETYPESELECTED
}ifEachSelected;

#define RECENTSEARCH @"recentlySearch"//搜索关键字
#define BRANDNAME    @"brand_name"//品牌
#define FAMILYNAME   @"family_name"//车系
#define ENGINEDESC   @"engine_desc"//排量
#define GEARBOXNAME  @"gearbox_name"//手自动挡
#define VEHICLECODE  @"vehicle_fgw_code"//车辆代码
#define VEHICLETYPE  @"vehicle_type"//不传
#define Limitation   @"不限"//不限制

#define LOCALSEARCH    @"localSearch"    //上次车型搜索关键字记录
#define LASTCARTYPE    @"lastCartype"    //最近一次车型选择所有的信息
#define LASTDEATILCAR  @"lastDatailCar"  //最近一次车型选择型号


#define BRANDARRAY          @"brand_name_array"
#define FAMILYARRAY         @"family_name_array"
#define ENGINEARRAY         @"engine_desc_array"
#define GEARBOXARRAY        @"gearbox_name_array"
#define VEHICLECODEARRAY    @"vehicle_fgw_code_array"
#define VEHICLETYPEARRAY    @"vehicle_type_array"

#define OLD_BRANDARRAY          @"old_brand_name_array"
#define OLD_FAMILYARRAY         @"old_family_name_array"
#define OLD_ENGINEARRAY         @"old_engine_desc_array"
#define OLD_GEARBOXARRAY        @"old_gearbox_name_array"
#define OLD_VEHICLECODEARRAY    @"old_vehicle_fgw_code_array"
#define OLD_VEHICLETYPEARRAY    @"old_vehicle_type_array"
int carFeature;

BOOL isCanGestureClick;        //手势是否可以恢复点击
BOOL islockWrong;        //手势解锁的输入是否正确
int selectIndex;
BOOL isCarClicked;
BOOL isLocaldata;        //是否显示上次选择好的车型信息
BOOL isCanClick;         //判断日历滑动是否结束来判断是否可以点击
BOOL isCalenderExist;    //日历界面是否已经存在
BOOL isReceiveSession;   //session请求接口是否正常返回数据

BOOL isWebtrendsOn;      //webtrends代码统计
#endif
