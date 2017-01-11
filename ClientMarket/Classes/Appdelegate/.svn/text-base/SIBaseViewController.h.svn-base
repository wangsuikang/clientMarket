//
//  SIBaseViewController.h
//  zizhubao
//
//  Created by 赵光超 on 14-3-11.
//  Copyright (c) 2014年 zgcrichard. All rights reserved.
//


/*  ---------------------------------------
 *
 *  ViewController的父类，封装常用的方法
 *  ---------------------------------------
 */

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
//#import "Const.h"
#import "VendorMacro.h"
#import "UtilsMacro.h"
#import "MacroDefinition.h"
//#import "Masonry.h"

@interface SIBaseViewController : UIViewController

@property (strong, nonatomic) UINavigationController *rootNavController;

/**
 *	@brief	自定义字体
 *  @param  fontName 自定义字体名字
 *  @param  size 自定义字体大小
 */
- (void)setFont:(NSString*)fontName WithSize:(float)size forLable:(UILabel*)lable;

/**
 *	@brief	获取整个设备屏幕的高度
 *
 *	@return	返回所获取到的设备高度
 */
- (float)getScreenHeight;

/**
 *	@brief	获取整个屏幕的宽度
 *
 *	@return	返回所获取到的设备宽度
 */
- (float)getScreenWidth;

/**
 *	@brief	设置圆角
 */
- (void)setRoundRect:(UIView*) view;

/**
 *	@brief	设置圆角
 */
- (void)setRoundRect:(UIView*) view cornerRadius:(CGFloat) cornerRadius;

/**
 *	@brief	设置圆角
 *
 *	@param 	width 	边框宽度
 */
- (void)setRoundRect:(UIView*) view cornerRadius:(CGFloat) cornerRadius borderWidth:(CGFloat)width;

/**
 *	@brief	创建按钮
 *
 *	@param 	title 	按钮标题
 *	@param 	frame 	按钮坐标
 *
 *	@return	返回按钮
 */
- (UIButton *)createUIButton:(NSString *)title frame:(CGRect)frame;
- (UIButton *)createUIButton:(NSString *)title frame:(CGRect)frame backImage:(NSString *)backImage;
/**
 *	@brief	创建文本框
 *
 *	@param 	placeholder 	提示语
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的文本框
 */
- (UITextField *)createUITextfield:(NSString *)placeholder frame:(CGRect)frame;

/**
 *	@brief	创建标签
 *
 *	@param 	title 	标签标题
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的标签
 */
- (UILabel *)createUILabel:(NSString *)title frame:(CGRect)frame;

/**
 *	@brief	自定义导航条
 *
 *	@param 	标题
 */
- (void)initNavigation:(NSString *)title;
- (void)initDangRiDaNavigation:(NSString *)title;
/**
 *	@brief	自助投导航条
 *
 *	@param 	标题
 */
//- (void)initSelfServiceNavigation:(NSString *)title;

/**
 *	@brief	警告提示
 *
 *	@param 	message 	提示语
 */
- (void)showAlert:(NSString *)message;

/**
 *	@brief	返回导航条高度
 *
 *	@return	返回高度
 */
- (CGFloat)getNavHeight;


/**
 *	@brief	登录定制导航栏
 *
 *	@param 	title 	登录标题
 */
- (void)initLoginNavigation:(NSString *)title;

/**
 *	@brief	创建导航条右按钮
 *
 *	@param 	strTitle 	按钮文字
 *
 *	@return	返回按钮
 */
- (UIButton *)createRightNavimgbtn:(NSString *)strTitle;

#pragma mark -创建通用导航条
- (void)initRootNavigation:(NSString *)title leftBackGroundImage:(NSString *)leftBackGroundImage leftLabelText:(NSString *)leftLabelText rightBackGroundImage:(NSString *)rightBackGroundImage rightLabelText:(NSString *)rightLabelText;

/**
 *	@brief	判断设备系统版本号是否小于7.0
 *
 *	@return	返回BOOL值
 */
- (BOOL)versionBelowSeven;

#pragma mark - 我的账户导航
- (void)initMyCustomerNavigation:(NSString *)title button:(UIButton *)button titleButton:(UIButton *)titleButton;
/**
 *	@brief	我的账户导航栏
 *
 *	@param 	title 	标题
 */
- (void)initMyAccountNavigation:(NSString *)title;

/**
 *	@brief	创建导航条右图片按钮
 *
 *	@param 	imgNormal 	正常图片
 *	@param 	highlighted 	高亮图片
 *
 *	@return	返回按钮
 */
- (UIButton *)createRightNavimgbtn:(UIImage *)imgNormal highlighted:(UIImage *)highlighted;

/**
 *	@brief	根据文本内容，字体，显示区域返回高度
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本字体大小
 *	@param 	size 	显示区域
 *
 *	@return	返回高度
 */
- (float)getTextHeight:(NSString *)text font:(UIFont *)font size:(CGSize)size;

/**
 *	@brief	根据文本内容，字体，显示区域返回宽度
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本字体大小
 *	@param 	size 	显示区域
 *
 *	@return	返回宽度
 */
- (float)getTextWidth:(NSString *)text font:(UIFont *)font size:(CGSize)size;

/**
 *	@brief	定制App的字体
 *
 *	@param 	fontSize 	字体大小
 *
 *	@return	返回定制的App字体
 */
- (UIFont *)appFontWithFontSize:(CGFloat)fontSize;

/**
 *	@brief	添加分割线
 *
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的分割线
 */
- (UIView *)addLine:(CGRect)frame;

/**
 *	@brief	正则判断是否手机号
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
- (BOOL)isMobilePhoneNumber:(NSString *)str;

/**
 *	@brief	字符串是否是空白
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
- (BOOL)isBlank:(NSString *)str;

/**
 *	@brief	判断对象是否为空、NULL、nil
 *
 *	@param 	obj 	对象
 *
 *	@return	返回BOOL值
 */
- (BOOL)isClassBlank:(id)obj;

/**
 *	@brief	判断是不是字符串类
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
- (BOOL)isString:(id)str;

/**
 *	@brief	获取本地文件Result内容
 *
 *	@param 	docName 	文件名称
 *
 *	@return	返回格式化后的字典
 */
- (id)returnLocalDataResult:(NSString *)docName;

/**
 *	@brief	将传过来的字典倒序排列
 *
 *	@param 	array 	需要排序的字典
 *
 *	@return	返回整理后的字典
 */
- (NSArray *)arrSortbyDESC:(NSArray *)array;

/**
 *	@brief	将需要排序的数组进行排序
 *
 *	@param 	array 	需要排序的数组
 *
 *	@return	返回排好序的数组
 */
- (NSArray *)arrSortbyACS:(NSArray *)array;

/**
 *	@brief	添加设置Default值方法
 *
 *	@param 	strKey 	Key
 *	@param 	strValue 	Value
 */
- (void)setDefaultValue:(id)strValue forKey:(NSString *)strKey;

/**
 *	@brief	取出Default中值方法
 *
 *	@param 	strKey 	Key
 *
 *	@return	返回取出的值
 */
- (id)getDefaultValuebyKey:(NSString *)strKey;

/**
 *	@brief	移除Default中值方法
 *
 *	@param 	strKey 	Key
 */
- (void)removeDefaultValuebyKey:(NSString *)strKey;

/**
 *	@brief	重新登录
 */
- (void)login;

/**
 *	@brief	添加导航阴影
 */
- (void)addNavigationShade;

/**
 *	@brief	判断字符串仅包含数字
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
- (BOOL)isNumeric:(NSString *)str;

/**
 *	@brief	去除字符串中空格
 *
 *	@param 	str 	需过滤字符串
 *
 *	@return	返回过滤后字符串
 */
- (NSString *)trimmingString:(NSString *)str;

/**
 *	@brief	加密字符串
 *
 *	@param 	str 	要加密的字符串
 *
 *	@return	返回加密后的字符串
 */
- (NSString *)encodeBaseString:(NSString *)str;

/**
 *	@brief	解密字符串
 *
 *	@param 	str 	要解密的字符串
 *
 *	@return	返回解密后的字符串
 */
- (NSString *)decodeBaseString:(NSString *)str;

/**
 *	@brief	正则判断是否是字母和数字
 *
 *	@param 	str 	字符串
 *
 *	@return	返回判断结果
 */
- (BOOL)isLetterNumber:(NSString *)str;

/**
 *	@brief	判断图形验证码符不符合要求
 *
 *	@param 	str 	用户输入的图形验证码
 *
 *	@return	返回BOOL值
 */
- (BOOL)isImageCode:(NSString *)str;

/**
 *	@brief	正则判断车牌号
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCarNo:(NSString *)str;

/**
 *	@brief	正则判断*车牌号
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCarNoCommon:(NSString *)str;
/**
 *	@brief	正则判断证件号码是否是身份证后六位或者是生日
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCertifiCate:(NSString *)str;

/**
 *	@brief	清理本地缓存数据
 */
-(void)clearAllCaches;

/**
 *	@brief	往字典中添加新的键值对
 *
 *	@param 	dic 	添加的键值对
 *
 *	@return	添加后的字典
 */
- (void)addNewDictionary:(NSMutableDictionary *)dicNew toOldDictionary:(NSMutableDictionary *)dicOld;
/**
 *	@brief	根据字符内容，显示字体大小，字体范围
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本内容字体大小
 *	@param 	size 	文本显示范围
 *
 *	@return	返回CGSize
 */
- (CGSize)getTextSize:(NSString *)text font:(UIFont *)font size:(CGSize)size;

/**
 *	@brief	获取字典中值
 *
 *	@param 	dictionary 	字典
 *	@param 	key 	key
 *
 *	@return	返回对应值
 */
- (id)dictionary:(NSDictionary *)dictionary objectForkey:(NSString *)key;

/**
 *	@brief	判断是否为空
 *
 *	@param 	str 	判断的字符串
 *
 *	@return	返回字符串
 */
- (NSString *)getNull:(NSString *)str;

/**
 *	@brief	加载等待图标显示
 */
- (void)loadingShow;

/**
 *	@brief	加载等待图标隐藏
 */
- (void)loadingHiden;

/**
 *	@brief	判断是否是江西邮政用户登录
 *
 *	@return	返回判断值
 */
- (BOOL)isPostOffice;

/**
 *	@brief	判断是否是湖南腾顺用户登录
 *
 *	@return	返回判断值
 */
- (BOOL)isHNTS;
/**
 *	@brief	判断是否是贵州邮政用户登录
 *
 *	@return	返回判断值
 */
- (BOOL)isGZYZ;
//惠民供销用户
- (BOOL)isHMGX;
//欧盈保
- (BOOL)isOYB;
- (float)zoomiPhone6Pto5;

/**
 *	@brief	顺时针旋转90°
 *
 *	@param 	v 	要旋转的View
 */
- (void)transFormclockwise:(UIView *)v;

/**
 *	@brief	逆时针旋转90°
 *
 *	@param 	v 	要旋转的View
 */
- (void)transFormCounterClockwise:(UIView *)v;
- (void)initMyIntsgraNavigation:(NSString *)title button:(UIButton *)button;

//判断是否是传统费率
- (BOOL)isTraditionUser;
- (CGFloat) getSize:(CGFloat)size;
@end
