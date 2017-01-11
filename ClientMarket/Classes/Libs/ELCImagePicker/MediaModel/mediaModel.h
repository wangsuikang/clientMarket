//
//  mediaModel.h
//  TomatoTown
//
//  Created by miller on 15/1/21.
//  Copyright (c) 2015年 Stan Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  判断多媒体类型的枚举
 */
typedef NS_ENUM(NSInteger, mediaType){
    /**
     *  视频
     */
    mediaTypeVideo = 150,
    /**
     *  图片
     */
    mediaTypeImage,
    /**
     *  刚拍摄的图片
     */
    mediaTypeJust
    
};

#import "parentModel.h"

@interface mediaModel : parentModel

@property (nonatomic,copy) NSString *UIImagePickerControllerMediaType;

@property (nonatomic,copy) NSString *UIImagePickerControllerOriginalImage;

@property (nonatomic,copy) NSString *UIImagePickerControllerReferenceURL;


@property (nonatomic,assign) NSInteger tag;

@property (nonatomic,assign) mediaType mediatype;

-(NSString *)getVideoUploadurl:(NSURL *)videoUrl;

//获取视频时间
- (CGFloat) getVideoDuration:(NSURL*) URL;

//获取视频 大小
- (unsigned long long) getFileSize:(NSString*) path;

//是否过长
-(BOOL)videoTimeIsLong:(CGFloat)time;

//是否过大
-(BOOL)videoSpaceIsBig:(unsigned long long)space;
@end
