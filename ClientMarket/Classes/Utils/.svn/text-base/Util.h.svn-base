//
//  Util.h
//  LocalCache
//
//  Created by tan on 13-2-6.
//  Copyright (c) 2013年 adways. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Util : NSObject
+ (NSString *)sha1:(NSString *)str;
+ (NSString *)md5Hash:(NSString *)str;
+ (UIColor *) stringTOColor:(NSString *)str;
+ (void)setData:(id)obj fileName:(NSString *)fileName;
+ (id)getDataFileName:(NSString *)fileName;
+(long long)fileSizeAtPath:(NSString *)fileName;
+ (NSString*)dataToJsonString:(id)object;
//警告框alertView
+ (void)showAlertView:(NSString *)title message:(NSString *)message delagate:(id)delagate cancleTitle:(NSString *)cancleTitle otherTitle:(NSString *)otherTitle;
+ (void)saveToUserDefaults:(id)object key:(NSString *)key;
+ (id)getUserDefaultsWithKey:(NSString *)key;
//适配各种屏幕
+ (CGFloat) getSize:(CGFloat)size;
//把文件写入沙盒
+ (void)writeFileToCashDict:(NSDictionary *)dict;
//计算文本的高度
+ (CGFloat)heightForString:(NSString *)str labelWidth:(CGFloat)labelWidth labelFont:(CGFloat)font;
CGImageRef PDFPageToCGImage(size_t pageNumber, CGPDFDocumentRef document);
+(NSString*)stringFromDate:(NSDate*)date;
+ (BOOL)isMobileNum:(NSString *)mobileNum;//判断是否是手机号
+ (BOOL)validateCarNo:(NSString *)carNo;  //车牌号正则匹配
+ (BOOL)validateEmail:(NSString *)email;  //邮箱正则匹配
@end
