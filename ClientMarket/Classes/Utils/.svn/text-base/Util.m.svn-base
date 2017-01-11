//
//  Util.m
//  LocalCache
//
//  Created by tan on 13-2-6.
//  Copyright (c) 2013年 adways. All rights reserved.
//

#import "Util.h"
#import <CommonCrypto/CommonDigest.h>
#import "MacroDefinition.h"

@implementation Util

+ (NSString *)sha1:(NSString *)str {
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *)md5Hash:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSString *md5Result = [NSString stringWithFormat:
                           @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                           result[0], result[1], result[2], result[3],
                           result[4], result[5], result[6], result[7],
                           result[8], result[9], result[10], result[11],
                           result[12], result[13], result[14], result[15]
                           ];
    return md5Result;
}

#pragma mark - 三基色
+(UIColor *) stringTOColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""]) {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}

//*********************写成data文件**************************
+ (void)setData:(id)obj fileName:(NSString *)fileName {
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [Path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    [NSKeyedArchiver archiveRootObject:obj toFile:filename];
}
//********************读取data文件***************************
+ (id)getDataFileName:(NSString *)fileName {
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = [Path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
    return dic;
}

+(long long)fileSizeAtPath:(NSString *)fileName {
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *str = [Path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",fileName]];
    if([fileManager fileExistsAtPath:str]){
        long long size=[fileManager attributesOfItemAtPath:str error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}
//data转化成json字符串
+ (NSString*)dataToJsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

//警告框
+ (void)showAlertView:(NSString *)title message:(NSString *)message delagate:(id)delagate cancleTitle:(NSString *)cancleTitle otherTitle:(NSString *)otherTitle {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:delagate cancelButtonTitle:cancleTitle otherButtonTitles:otherTitle, nil];
    [alertView show];
}

+ (void)saveToUserDefaults:(id)object key:(NSString *)key {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:object forKey:key];
        [standardUserDefaults synchronize];
    }
}

+ (id)getUserDefaultsWithKey:(NSString *)key {
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        return [standardUserDefaults objectForKey: key];
    }
    return nil;
}

#pragma mark - 屏幕尺寸的适配
+ (CGFloat) getSize:(CGFloat)size {
    
    CGFloat heigth =[UIScreen mainScreen].bounds.size.height;
    float zoom = 1.0f;
    if (heigth == 736) {
        //iPhone6 Plus 逻辑分辨率 414*736
        zoom = (float)1.0f;
    }else if (heigth == 667) {
        //iPhone6  逻辑分辨率 375*667
        zoom = (float)667/736;
    }else if (heigth == 568) {
        //iPhone5S 逻辑分辨率 320*568
        zoom = (float)568/736;
    }else if (heigth == 480) {
        //iPhone 4/4S
        zoom = (float)568/736;
    }
    
    return size/3 * zoom;
}

//把文件写入沙盒
+ (void)writeFileToCashDict:(NSDictionary *)dict {
    NSString *homepath =NSHomeDirectory();
    NSString  *path = [homepath stringByAppendingPathComponent:@"record.text"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"path++++%@",path);
//    NSArray *array = @[@"yes",@"no"];
    BOOL re = [dict writeToFile:path atomically:YES];
    if (re) {
        NSLog(@"write yes");
    }
}

#pragma mark - 计算label的自适应高度
+ (CGFloat)heightForString:(NSString *)str labelWidth:(CGFloat)labelWidth labelFont:(CGFloat)font {
    
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake(labelWidth, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    return size.height;
}

#pragma mark -pdf转图片
CGImageRef PDFPageToCGImage(size_t pageNumber, CGPDFDocumentRef document)

{
    CGPDFPageRef	page;
    CGRect		pageSize;
    CGContextRef	outContext;
    CGImageRef	ThePDFImage;
    //CGAffineTransform ctm;
    page = CGPDFDocumentGetPage (document, pageNumber);
    if(page)
    {
        pageSize = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
        
        outContext= CreateARGBBitmapContext (pageSize.size.width, pageSize.size.height);
        if(outContext)
        {
            CGContextDrawPDFPage(outContext, page);
            ThePDFImage= CGBitmapContextCreateImage(outContext);
            int *buffer;
            
            buffer = CGBitmapContextGetData(outContext);
            //NSLog(@"%d",buffer);
            free(buffer);
            
            CGContextRelease(outContext);
            CGPDFPageRelease(page);
            return ThePDFImage;  
        }
    }
    return NULL;
} 

CGContextRef CreateARGBBitmapContext (size_t pixelsWide, size_t pixelsHigh)
{
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    // Get image width, height. We’ll use the entire image.
    //  size_t pixelsWide = CGImageGetWidth(inImage);
    //  size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    //colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    if (sizeof(bitmapData))
    {
        //NSLog(@"size %d",bitmapData);
        //free(bitmapData);
    }
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}

+(NSString*)stringFromDate:(NSDate*)date
{
    NSDateFormatter *formatter=  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSString *loctime = [formatter stringFromDate:date];
    return loctime;
}
#pragma mark- 判断是否是手机号
+ (BOOL)isMobileNum:(NSString *)mobileNum {
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}
#pragma mark - 车票号正则匹配
/*车牌号验证 MODIFIED BY HELENSONG*/
+ (BOOL)validateCarNo:(NSString *)carNo {
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

#pragma mark - 邮箱正则匹配
+ (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
