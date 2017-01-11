//
//  NdUncaughtExceptionHandler.m
//  ExceptionTest
//
//  Created by admin on 14-6-11.
//  Copyright (c) 2014年 zgcrichard. All rights reserved.
//

#import "NdUncaughtExceptionHandler.h"

NSString *applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

void UncaughtExceptionHandler(NSException *exception) {
    
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"Exception.txt"];
    NSString *strErrorMsg = @"";
    //  判断路径是否存在，存在获取已经存在的错误报告
    if ([[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        NSError *error;
        strErrorMsg = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:&error];
    }
    
    //定义时间点
    NSDate *date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy年MM月dd日 HH:mm:SS"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSString* strDate = [formatter stringFromDate:date];
    
    //开始获取新的错误报告
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSString *url = [NSString stringWithFormat:@"\n==========================异常崩溃报告开始 %@\nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@\n==========================异常崩溃报告结束 %@\n",strDate,name,reason,[arr componentsJoinedByString:@"\n"],strDate];
    //追加新的错误报告到错误日志里面
    strErrorMsg = [strErrorMsg stringByAppendingString:url];
    NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [strErrorMsg writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //除了可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器等
    //还可以选择调用发送邮件的的程序，发送信息到指定的邮件地址
    //或者调用某个处理程序来处理这个信息
}

@implementation NdUncaughtExceptionHandler

-(NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (void)setDefaultHandler
{
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}

+ (NSUncaughtExceptionHandler*)getHandler
{
    return NSGetUncaughtExceptionHandler();
}

@end
