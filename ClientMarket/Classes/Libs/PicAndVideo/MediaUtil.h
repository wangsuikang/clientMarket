//
//  MediaUtil.h
//  parent
//
//  Created by 郭绍俊 on 4/16/15.
//  Copyright (c) 2015 tomatotown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MediaUtil : NSObject

+ (UIImage *)resizeUploadingImage:(UIImage *)origImage;

+ (NSString *)generateJPEGFileForUploading:(UIImage *)image withIndex:(NSInteger)index;

@end
