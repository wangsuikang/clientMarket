//
//  mediaModel.m
//  TomatoTown
//
//  Created by miller on 15/1/21.
//  Copyright (c) 2015年 Stan Wu. All rights reserved.
//

#import "mediaModel.h"
#import "ELCImagePickerController.h"

@interface mediaModel ()



@end

@implementation mediaModel

//-(NSString *)getVideoUploadurl:(NSURL *)videoUrl{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat: @"yyyy-MM-dd-HH-mm-ss"];
//    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
//    NSString *timeDesc = [formatter stringFromDate:[NSDate date]];
//    
//    NSString *key = [NSString stringWithFormat:@"%@", timeDesc];
//    NSString *filePath = [key videoCachePath];
//
//    [Util convert2Mp4:videoUrl withNewUrl:[NSURL fileURLWithPath:filePath]];
//    return filePath;
//}
//
//-(NSString *)convertVideoToMp4:(NSURL *)url path:(NSString *)path{
//    
//    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
//    
//    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset
//                                                                          presetName:AVAssetExportPresetPassthrough];
//    exportSession.outputURL = [NSURL fileURLWithPath: path];
//    exportSession.shouldOptimizeForNetworkUse = YES;
//    exportSession.outputFileType = AVFileTypeMPEG4;
//    [exportSession exportAsynchronouslyWithCompletionHandler:^{
//        switch ([exportSession status]) {
//            case AVAssetExportSessionStatusFailed:
//            {
//                
//                break;
//            }
//                
//            case AVAssetExportSessionStatusCancelled:
//                NSLog(@"Export canceled");
//                
//                break;
//            case AVAssetExportSessionStatusCompleted:
//                NSLog(@"Successful!");
//                break;
//            default:
//                break;
//        }
//        
//    }];
//    
//     KindroidLog(@"filePath:%@",path);
//    return path;
//}

//-(BOOL)checkUrlIsMp4:(NSString *)url{
//    
//    if ([url hasSuffix:@"MOV"]) {
//        return NO;
//    }
//    return  YES;
//}

//获取视频时间
//- (CGFloat) getVideoDuration:(NSURL*) URL
//{
//    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
//                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
//    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:URL options:opts];
//    float second = 0;
//    second = urlAsset.duration.value/urlAsset.duration.timescale;
//    return second;
//}

//获取视频 大小
//- (unsigned long long) getFileSize:(NSString*) path
//{
//    KindroidLog(@"path:%@",path);
//    
//    NSFileManager * filemanager = [[NSFileManager alloc]init];
//    if([filemanager fileExistsAtPath:path]){
//        unsigned long long size = [[filemanager attributesOfItemAtPath:path error:nil] fileSize
//        ];
//        return size;
//    }
//    else
//    {
//        return -1;
//    }
//}

//-(BOOL)videoTimeIsLong:(CGFloat)time{
//    if (time>=5*60.0) {
//        return NO;
//    }
//    return YES;
//}
//
//-(BOOL)videoSpaceIsBig:(unsigned long long)space{
//    unsigned long long value =30*1024*1024;
//    if (space > value) {
//        return YES;
//    }
//    return NO;
//}
@end
