//
//  VendorMacro.h
//  zizhubao
//
//  Created by 赵光超 on 14-4-1.
//  Copyright (c) 2014年 PingAn. All rights reserved.
//

#import <UIKit/UIKit.h>
#define timeOutValue             20   //请求超时时间
#define ColorOrange [UIColor colorWithRed:255/255.0f green:102/255.0f blue:50/255.0f alpha:1.0f]
#define ColorLightBlue 0x61c4c1

#define ZZBdeviationHeight       20

//自助保暂存单记录第一次的时间
#define ZZBFirstSaveTemporaryList @"firstSaveTempList"
#define ZZBSaveTemporaryList @"saveListInfo"
#define ZZBGetListInfo @"loadListInfo"

//首页广告宣导图
#define isShowImage @"isShowImage"
#define ifHasShow @"ifHasShow"


//最近一次签到的时间
#define ZZBRecentSignTime @"RecentSignTime"

//投保首页城市code
#define ZZBCITYCODE     @"cityCode"
//投保首页城市名字
#define ZZBCITYNAME     @"cityName"
//投保首页车牌
#define ZZBCARCODE      @"carCode"

//报价投首页城市code
#define ZZBINSURTCITYCODE     @"cityInsurtCode"
//报价投首页城市名字
#define ZZBINSURTCITYNAME     @"cityInsurtName"
//报价投首页车牌
#define ZZBINSURTCARCODE      @"carInsurtCode"

//媒体来源
#define ZZBMediaSource        @"mediaSource"

#define ZZBISSHOWNATIONSCORE  @"isShowNationScore"

//登录成功之后所有的data数据，即前端h5界面需要的数据key值
#define ZZBLoginData          @"zzbLoginData"

//报价投-to-query-info接口返回的数据
#define ZZBINSURTDATA  @"insurtData"
//报价投拼装的后需要传给网页的数据
#define ZZBQUERYINFODATA  @"queryInfoData"
//报价投写进cookie的数据
#define ZZBCOOKIEDATA  @"CookieData"


//设备ID
#define ZZBDDEVICETOKEN @"deviceToken"
//新车未上牌要传的JsonString
#define ZZBRENEWAL_JSON @"renewaljson"
//我的订单页面要传到网页的找回报价信息
#define ZZBPRICEBACK_DIC @"pricebackDic"

//存取的合作商代码,最多五条
#define ZZBPartnerCode   @"zzbPartnerCode"
//导航条高度
#define ZZBnavHeight          64
//积分抵扣金额比率
#define ZZBscoreMoney         500
//每页条数
#define ZZBpageCount          20
//发送短信间隔时间（秒）
#define ZZBsecs               60
//记录tocken
#define ZZBMyapptoken         @"token"
//正常登录即滑手势解锁
#define ZZBopenNormal         @"openNormal"
//登录流程即从登录流程开始
#define ZZBopenLogin          @"openLogin"
//首页即打开不需要登录直接到首页
#define ZZBopenMain           @"openMain"
//判断Key
#define ZZBopenKey            @"openKey"
//用户手机号
#define ZZBuserID             @"userID"
//唯一标示码
#define ZZBKEYCHAINUDID       @"keychainUIID"
//网络异常语句
#define ZZBrequestNetWorkLost @"网络不给力哦，请检查网络"
//提示语标题
#define ZZBAlertTitle         @"提示"
//请求失败
#define ZZBrequestFail        @"请求失败"
//已经加载完成全部数据
#define ZZBrequestDone        @"已经加载完成全部数据"
//数据异常
#define ZZBrequestDataError   @"返回数据异常"
//请求超时
#define ZZBrequestTimeOut     @"请求超时，请稍后重试"
//记录是从AppDelegate进入
#define ZZBcomeType           @"comeType"
#define ZZBcomeAppDelegate    @"AppDelegate"
#define ZZBcomeSIPattern      @"SIPattern"
//记录自助投是网页前进和后退
#define ZZBcomeSelfServiceType @"orderDetail"
//从密保问题返回的
#define ZZBcomeQuestion       @"comeFromQuestion"
//从设置界面返回的
#define ZZBcomeSetting        @"comeFromSetting"
//从设置密保问题返回的
#define ZZBcomeSetQuetion     @"comeSetQuetion"
//从回答密保问题返回的
#define ZZBAnswerQuetion     @"comeAnswerQuetion"
//从自助投返回的
#define ZZBcomeSelfService    @"comeFromSelfService"
//从投保首页跳转的
#define ZZBcomeHomePage       @"comeFromHomePage"
//从推好友返回的
#define ZZBcomeRecommend      @"comeFromRecommend"
//从我的账户投返回的
#define ZZBcomeMyAcount       @"comeFromMyAcount"
//从我的订单返回的
#define ZZBcomeMyOrder        @"comeFromMyOrder"
//从我的订单详情跳转的
#define ZZBcomeMyOrderDetail  @"comeFromMyOrderDetail"
//车辆搜索界面(自助投)
#define ZZBcomeCarSearch      @"comeFromCarSearch"
//从车型选择返回(自助投)
#define ZZBcomeCarFeature     @"comeFromCarFeature"
//从车辆具体特性选择返回(自助投)
#define ZZBcomeCarSelect      @"comeFromCarSelect"
//从我的消息中心返回的
#define ZZBcomeMyMessage      @"comeFromMyMessage"
//MessageID
#define ZZBMESSAGEID          @"MESSAGEID"
//合作商代码
#define ZZBComperationCode    @"ZZBComperationCode"
//判断是否是平邮用户登录
#define ZZBPostUserIDKey      @"ZZBPostUserID"
//判断是否是湖南腾顺用户登录
#define ZZBHNTSUserIDKey      @"ZZBHNTSUserID"
//判断是否是贵州邮政的用户登录
#define ZZBGZYZUserIdKey      @"ZZBGZYZUserID"
//判断是否是广西邮政用户登录
#define ZZBPostGXYZUserIDKey  @"ZZBGXYZPostUserIDKey"
//判断是否是欧盈保用户登录
#define ZZBOYBUserIdKey       @"ZZBOYBUserIdKey"
//判断是否是惠民供销用户登录
#define ZZBHMGXUserIdKey       @"ZZBHMGXUserIdKey"


//平邮用户登录YES
#define ZZBPostUserIDYES      @"ZZBPostUserIDYES"
//广西邮政用户登录YES
#define ZZBPostGXYZUserIDYES  @"ZZBPostGXYZUserIDYES"
//湖南腾顺用户登录YES
#define ZZBHNTSUserIDYES      @"ZZBHNTSUserIDYES"
//贵州邮政用户登录YES
#define ZZBGZYZUserIdYES      @"ZZBGZYZUserIdYES"
//欧盈保用户登录YES
#define ZZBOYBUserIdYES       @"ZZBOYBUserIdYes"
//惠民供销用户登录YES
#define ZZBHMGXUserIdYES       @"ZZBHMGXUserIdYes"

//湖南腾顺用户登录NO
#define ZZBHNTSUserIDNO       @"ZZBHNTSUserIDNO"
//平邮用户登录NO
#define ZZBPostUserIDNO       @"ZZBPostUserIDNO"
//广西邮政用户登录NO
#define ZZBPostGXYZUserIDNO   @"ZZBPostGXYZUserIDNO"
#define ZZBGZYZUserIdNO       @"ZZBGZYZUserIdNO"
//自助保欧盈保登录NO
#define ZZBOYBUserIdNO        @"ZZBOYBUserIdNO"
//自助保惠民供销登录NO
#define ZZBHMGXUserIdNO        @"ZZBHMGXUserIdNO"

//导航栏标题字体大小
#define ZZBNAVTITLEFONT       18
//按钮标签字体大小
#define ZZBBUTTONLABELFONTS   20
//标签字体小一号
#define ZZBLABELFONTS         13
//标签字体中
#define ZZBLABELFONTM         15
//标签字体大一号
#define ZZBLABELFONTB         18
//自定义字体，需要修改
#define ZZBCUSTOMFONT        @"SystemFont"     //@"HiraKakuProN-W3"
//系统字体
#define ZZBSYSTEMFONT        @"SystemFont"     //@"SystemFont"


//默认请求URL
#define ZZBDEFAULTURL  @"http://u.pingan.com"

//第一次进入
#define ZZBFIRSTENTER  @"isFristTime"
//上次版本更新检测的日期（年月日时分秒）
#define ZZBLASTUPDATETIME @"lastCheckUpdateTime"

//创建我的消息中心的数据表
#define ZZBMYMESSAGETABLE @"mymessageTable"
//创建推好友发送的数据表
#define ZZBMYRECOMMENDTABLE @"myRecFriendTable"
//手机号
#define ZZBMOBILEPHONE  @"phoenNum"

//设置中通知的开关
#define ZZBNOTIFICATION @"NotificationState"

//设置中图形解锁的开关
#define ZZBGESTURE      @"GestureState"

//是否设置过当日达界面的图形锁
#define ZZBIsNotFirstComeDangRiDa @"isNotFirst"
#define ZZBDangriDa     @"zzbDangRiDa"

//密保问题的string
#define ZZBQUESTIONTEXT @"questionText"
//密保回答的string
#define ZZBANSWERTEXT   @"answerText"

//加密Key
#define ZZBENCODEKEY    @"com.pingan.zzbENCODE"

//微信分享的信息保存网页
#define ZZBWEICHATTEXT  @"weichatShareText"
//微信分享的显示内容
#define ZZBWEICHATContent   @"weichatContent"
//微信分享的跳转链接
#define ZZBWEICHATURL       @"weichatURL"

//短信分享的信息保存
#define ZZBIMESSAGETEXT @"iMessageShareText"

//第一次进入推好友界面
#define ZZBfirstEnterRecFriend @"firstEnterRecFriend"

//首页请求数据存储
#define  ZZBmainScrollArray    @"mainScrollArray"

//JS调用本地loding方法
#define ZZBSHOWDIALOG      @"showDialog"//showDialog
//JS调用本地删除loding方法
#define ZZBDISMISSDIALOG   @"dismissDialog"
//JS调用本地alert方法
#define ZZBALERT           @"alert"
//JS调用本地提示框方法
#define ZZBCONFIRM         @"confirm"
//JS调用本地时间选择方法
#define ZZBCITYPICKER      @"showCityPicker"
//JS调用本地车型搜索模块
#define ZZBSEARCHCAR       @"SearchCarType"
//JS调用车架号
#define ZZBSEARCHMODEL     @"SearchCarModel"
//JS调用本地车辆新保信息(自助投)
#define ZZBRENEWALINFO     @"RenewalInfo"
//JS调用本地日历模块
#define ZZBCALENDAR        @"CalendarPart"
//JS调用返回投保首页
#define ZZBZZTMAIN         @"backToZZTMain"
//JS调用城市列表数据源
#define ZZBCITYSOURCE      @"citySearch"
//JS调用本地发送找回报价的信息的方法
#define ZZBGETPRICEBACK    @"getPriceBack"
//投保流程城市选择
#define ZZBCITY            @"Province"
//talkingData事件
#define ZZBTALKDATAEVENT   @"sendEvent"
//JS调用本地车辆信息(报价投)
#define ZZBINSURTINFO      @"getInsuredInfo"
//获取车型选择的车辆信息
//#define ZZBSelectCarInfoNew   @"ZZBSelectCarInfoNew"
//从ZZBSearchCarDetailViewController返回
#define ZZBSearchCarDetailBackKey  @"ZZBSearchCarDetailBackKey"
//从ZZBSearchCarDetailViewController返回
#define ZZBSearchCarDetailBackValue  @"ZZBSearchCarDetailBackValue"
#define COMMONCITY @"commonCitys"        //常用城市
//保存业务员ID
#define ZZBSaleAgnetID     @"saveSaleAgnetID"
//好伙伴跳转过来Key
#define ZZBCooperation     @"ZZBCooperation"

#define ZZBTimeOut          @"连接超时,请稍后再试"
#define ZZBServerException  @"服务器异常"
#define ZZBNoNewVersion     @"当前版本已是最新版本"//@"没有检测到更新的版本"
#define ZZBIsHavePrintOrder @"isHavePrintOrder"//有打印订单的权限


//媒体来源
#define ZZBsourceTypeHaohuoban @"sc03-zzb-00002"//来源好伙伴
#define ZZBsourceTypeZizhubao  @"sc03-zzb-00004"//来源自助保(自助投）
#define ZZBsourceTypeNewFlow   @"sc03-zzb-00004"//来源自助保(报价投）
#define ZZBTraditionMediasource @"sc03-zzb-ct"  //自助保传统费率媒体来源

#define ZZBsourceTypeKey       @"sourceTypeKey" //媒体来源Key
#define ZZBchangeUser          @"ZZBchangeUser" //更换账户
#define ZZBchangeUserKey       @"ZZBchangeUserKey" //更换账户
#define ZZBQrcodeImage         @"ZZBQrcodeImage"

//日历显示的默认最大最小年份
#define maxYearDefault @"2050-12-31"
#define minYearDefault @"1950-01-01"

//存取宣导图信息
#define mainRollingPic      @"mainScrollPic"

////////////////////传统费率//////////////////////////
#define ISTradtionUser @"isTraditionUser"
//#define agentId @"agentId"
///////////////////传统费率///////////////////////////

//ipad判断的宏
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark -- webtrends检测代码字段

#define WT_Mobile     @"WT.pa_tbuid"    //手机号
#define WT_StepName   @"WT.pa_sku"      //流程名称
#define WT_PageName   @"WT.page_name"   //页面名称
#define WT_SearchKey  @"WT.oss"         //搜索关键字
#define WT_OrderID    @"WT.tx_i"        //订单号
#define WT_SpendTime  @"WT.spend_time"  //流程时间
#define WT_BusinessID @"WT.pa_applyno"  //商业险单号
#define WT_WebID      @"WT.mc_id"  //混合开发网页穿参
@interface VendorMacro : UIViewController

@end
