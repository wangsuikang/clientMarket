//
//  MediaUtil.m
//  parent
//
//  Created by 郭绍俊 on 4/16/15.
//  Copyright (c) 2015 tomatotown. All rights reserved.
//

#import "MediaUtil.h"
@implementation MediaUtil

#define MAX_UPLOAD_IMAGE_SIZE 1280

+ (UIImage *)resizeUploadingImage:(UIImage *)origImage {
    CGSize origSize = origImage.size;
    CGSize newSize = origSize;
    if (origSize.height > MAX_UPLOAD_IMAGE_SIZE && origSize.width > MAX_UPLOAD_IMAGE_SIZE) {
        if (origSize.width > origSize.height) {
            newSize.width = MAX_UPLOAD_IMAGE_SIZE;
            newSize.height = newSize.width * origSize.height / origSize.width;
        } else {
            newSize.height = MAX_UPLOAD_IMAGE_SIZE;
            newSize.width = newSize.height * origSize.width / origSize.height;
        }
    } else if (origSize.height > MAX_UPLOAD_IMAGE_SIZE) {
        newSize.height = MAX_UPLOAD_IMAGE_SIZE;
        newSize.width = newSize.height * origSize.width / origSize.height;
    } else if (origSize.width > MAX_UPLOAD_IMAGE_SIZE) {
        newSize.width = MAX_UPLOAD_IMAGE_SIZE;
        newSize.height = newSize.width * origSize.height / origSize.width;
    } else {
        return origImage;
    }
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);

    // Tell the old image to draw in this new context, with the desired
    // new size
    [origImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];

    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

    // End the context
    UIGraphicsEndImageContext();

    return newImage;
}

//+ (NSString *)generateJPEGFileForUploading:(UIImage *)image withIndex:(NSInteger)index {
//    UIImage *newImage = [MediaUtil resizeUploadingImage:image];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat: @"yyyy-MM-dd-HH-mm-ss"];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
//    NSString *timeDesc = [formatter stringFromDate:[NSDate date]];
//    NSString *key = [NSString stringWithFormat:@"%@_%ld.jpg", timeDesc, (long)index];
//    NSString *filePath = [key imageCachePath];
//    NSData *data = UIImageJPEGRepresentation(newImage, 1);
//    if (data.length > 150*1024) {
//        data = UIImageJPEGRepresentation(newImage, UPLOAD_JPEG_QUALITY);
//    }
//    [data writeToFile:filePath atomically:YES];
//    return filePath;
//}


@end
