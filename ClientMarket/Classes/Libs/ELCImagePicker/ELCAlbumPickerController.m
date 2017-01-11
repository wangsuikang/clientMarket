//
//  AlbumPickerController.m
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//
#define LeftBarButtonItemTag 101
#define RightBarButtonItemTag 102

#import "ELCAlbumPickerController.h"
#import "ELCImagePickerController.h"
#import "ELCAssetTablePicker.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>
#import "mediaModel.h"
#import "MediaUtil.h"


@interface ELCAlbumPickerController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) ALAssetsLibrary *library;

@property (nonatomic) BOOL IsOpenedCamera;

@property (nonatomic,strong) mediaModel *mediaMolel;

@property (nonatomic,assign) NSInteger mediaTag;

@end

@implementation ELCAlbumPickerController

//Using auto synthesizers

#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	
	//[self.navigationItem setTitle:NSLocalizedString(@"Loading...", nil)];

    [self addBarButtonItemWithTitle:@"取消" imageName:@"" frame:CGRectMake(0, 0, 60, 18) target:self.parent action:@selector(cancelImagePicker) isLeft:NO isCircle:YES];
    if (_controllerType==controllerWonderful) {
        [self addBarButtonItemWithTitle:@"拍照" imageName:@"" frame: CGRectMake(0, 0, 60, 44)target:self action:@selector(NavgationBarItem:) isLeft:YES isCircle:YES];
    }
    
    if (_controllerType==controllerFriend) {
        [self.navigationItem setTitle:NSLocalizedString(@"相册", nil)];
        _IsOpenedCamera = YES;
    }
    
    if (_controllerType==controllerChat) {
        [self addBarButtonItemWithTitle:_mediaType imageName:@"" frame: CGRectMake(0, 0, 60, 18)target:self action:@selector(NavgationBarItem:) isLeft:YES isCircle:YES];
        
        BOOL isPhoto;
        if ([_mediaType isEqualToString:@"拍照"]) {
            isPhoto = YES;
        }else{
            isPhoto = NO;
        }
        
        [self.navigationItem setTitle:isPhoto?NSLocalizedString(@"相册", nil):NSLocalizedString(@"视频", nil)];
    }
    
    if (_controllerType==controllerShareImage) {
        
        [self.navigationItem setTitle:NSLocalizedString(@"相册", nil)];
        _IsOpenedCamera = YES;
        
    }
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	self.assetGroups = tempArray;
    
    ALAssetsLibrary *assetLibrary = [[ALAssetsLibrary alloc] init];
    self.library = assetLibrary;

    // Load Albums into assetGroups
    dispatch_async(dispatch_get_main_queue(), ^
    {
        @autoreleasepool {
        
        // Group enumerator Block
            void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop) 
            {
                if (group == nil) {
                    return;
                }
                
                // added fix for camera albums order
                NSString *sGroupPropertyName = (NSString *)[group valueForProperty:ALAssetsGroupPropertyName];
                NSUInteger nType = [[group valueForProperty:ALAssetsGroupPropertyType] intValue];
                
                if ([[sGroupPropertyName lowercaseString] isEqualToString:@"camera roll"] && nType == ALAssetsGroupSavedPhotos) {
                    [self.assetGroups insertObject:group atIndex:0];
                }
                else {
                    [self.assetGroups addObject:group];
                }

                // Reload albums
                [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:YES];
            };
            
            // Group Enumerator Failure Block
            void (^assetGroupEnumberatorFailure)(NSError *) = ^(NSError *error) {
              
                if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied) {
                    NSString *errorMessage = NSLocalizedString(@"This app does not have access to your photos or videos. You can enable access in Privacy Settings.", nil);
                    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Access Denied", nil) message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
                  
                } else {
                    NSString *errorMessage = [NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]];
                    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
                }

                [self.navigationItem setTitle:nil];
                NSLog(@"A problem occured %@", [error description]);	                                 
            };	
                    
            // Enumerate Albums
            [self.library enumerateGroupsWithTypes:ALAssetsGroupAll
                                   usingBlock:assetGroupEnumerator 
                                 failureBlock:assetGroupEnumberatorFailure];
        
        }
    });
    
}

- (void)addBarButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName frame:(CGRect)frame target:(id)target action:(SEL)action isLeft:(BOOL)isLeft isCircle:(BOOL)isCircle{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (isCircle) {
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10;
    }
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //[button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //    [button setBackgroundColor:[UIColor cyanColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        button.tag = 101;
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 30)];
        self.navigationItem.leftBarButtonItem = item;
    }else{
        button.tag = 102;
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
        self.navigationItem.rightBarButtonItem = item;
    }
    
    if ([title isEqualToString:@"拍照"]) {
        _IsOpenedCamera = YES;
    }
    
    if ([title isEqualToString:@"摄像"]) {
        _IsOpenedCamera = NO;
    }
    
}

-(void)NavgationBarItem:(UIButton *)button{
    switch (button.tag) {
        case LeftBarButtonItemTag:
        {
            if (_IsOpenedCamera) {
                NSLog(@"点击了拍照按钮");
                [self takingCameraPhotograph];
            }else{
                NSLog(@"点击了摄像按钮");
                [self takingVideoShooting];
            }
        }
            break;
        case RightBarButtonItemTag:
        {
            
        }
            break;
        default:
            break;
    }
    
}
/**
 *  调取摄像功能
 */
-(void)takingVideoShooting{
    // 判断有摄像头，并且支持拍照功能
    
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]){
        
        // 初始化图片选择控制器
        
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        
        // 设置所支持的类型，设置只能录像
        
        NSString *requiredMediaType1 = ( NSString *)kUTTypeMovie;
        
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType1,nil];
        
        [controller setMediaTypes:arrMediaTypes];
        
        // 设置录制视频的质量
        
        [controller setVideoQuality:UIImagePickerControllerQualityType640x480];
        
        //设置最长摄像时间
        
        [controller setVideoMaximumDuration:5*60.f];
        
        [controller setAllowsEditing:YES];// 设置是否可以管理已经存在的图片或者视频
        
        [controller setDelegate:self];// 设置代理
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self presentViewController:controller animated:YES completion:nil];
        });
        
        
    } else {
        
        NSLog(@"Camera is not available.");
        
    }
}
/**
 *  调取拍照功能
 */
-(void)takingCameraPhotograph{
    
    // 判断有摄像头，并且支持拍照功能
    
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]){
        
        //初始化图片选择控制器
        
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];// 设置类型
        
        // 设置所支持的类型，设置只能拍照
        
        NSString *requiredMediaType = (__bridge  NSString *)kUTTypeImage;
        
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType,nil];
        
        [controller setMediaTypes:arrMediaTypes];
        
        [controller setAllowsEditing:NO];// 设置是否可以管理已经存在的图片或者视频
        
        [controller setDelegate:self];// 设置代理
        
        [self presentViewController:controller animated:YES completion:nil];
        
    } else {
        
        NSLog(@"Camera is not available.");
        
    }
}
// 判断设备是否有摄像头

- (BOOL) isCameraAvailable{
    
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
}

// 判断是否支持某种多媒体类型：拍照，视频

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    
    __block BOOL result = NO;
    
    if ([paramMediaType length] == 0){
        
        NSLog(@"Media type is empty.");
        
        return NO;
        
    }
    
    NSArray *availableMediaTypes =[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL*stop) {
        
        NSString *mediaType = (NSString *)obj;
        
        if ([mediaType isEqualToString:paramMediaType]){
            
            result = YES;
            
            *stop= YES;
            
        }
        
        
    }];
    
    return result;
    
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate{
    return NO;
}

// 检查摄像头是否支持拍照

- (BOOL) doesCameraSupportTakingPhotos{
    
    return [self cameraSupportsMedia:(NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypeCamera];
    
}
#pragma mark - UIImagePickerController的代理方法
// 保存图片后到相册后，调用的相关方法，查看是否保存成功

- (void) imageWasSavedSuccessfully:(UIImage *)paramImage didFinishSavingWithError:(NSError *)paramError contextInfo:(void *)paramContextInfo{
    
    
    if (paramError == nil){
        
        NSLog(@"Image was saved successfully.");
        
        //[self.tableView reloadData];
        
    } else {
        
        NSLog(@"An error happened while saving the image.");
        
        NSLog(@"Error = %@", paramError);
        
    }
    
}

//保存视频到图库

- (void)videoSavedToPhotosAlbum:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        
        NSLog(@"video was saved successfully.");
        
        //[self.tableView reloadData];
    }else {
        NSLog(@"An error happened while saving the video.");
        
        NSLog(@"Error = %@", error);
    }
}

// 当得到照片或者视频后，调用该方法

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"Picker returned successfully.");
    
    NSLog(@"info:%@", info);
    
    _mediaMolel = [[mediaModel alloc]init];
    [_sendMediaArray removeAllObjects];
    _sendMediaArray = [[NSMutableArray alloc]initWithCapacity:1];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    // 判断获取类型：图片
    
    if ([mediaType isEqualToString:@"public.image"]){
        
        _mediaTag = mediaTypeJust;
        
        UIImage *theImage = nil;
        
        // 判断，图片是否允许修改
        
        if ([picker allowsEditing]){
            
            //获取用户编辑之后的图像
            
            theImage = [info objectForKey:UIImagePickerControllerEditedImage];
            
        } else {
            
            // 照片的元数据参数
            
            theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            
        }
        
        // 保存图片到相册中
        
        SEL selectorToCall = @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
        
        UIImageWriteToSavedPhotosAlbum(theImage, self,selectorToCall, NULL);
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSString *path = [MediaUtil generateJPEGFileForUploading:image withIndex:0];

        [_sendMediaArray addObject:path];
        

    }else if ([mediaType isEqualToString:@"public.movie"]){

        NSURL *url = info[@"UIImagePickerControllerMediaURL"];
        
        NSString *videoPath = [url  path];
        
        SEL selectorToCall = @selector(videoSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:);
        
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, selectorToCall,nil);
        
        //_mediaMolel.UIImagePickerControllerReferenceURL = (NSString *)url;
        _mediaTag = mediaTypeVideo;
        NSString *path = [_mediaMolel getVideoUploadurl:url];
        [_sendMediaArray addObject:path];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    
    if (_showBlock) {
        _showBlock(_sendMediaArray,_mediaTag);
    }
    
    [_sendMediaArray removeAllObjects];
}


// 当用户取消时，调用该方法

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    NSLog(@"用户取消了");
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

//#pragma mark - 视频转换为MP4格式
//-(void)convertVideoToMp4AndSave:(NSURL *)url{
//    NSString *path;
//    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:url options:nil];
//    AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset
//                                                                          presetName:AVAssetExportPresetMediumQuality];
//    NSLog(@"%@", exportSession.supportedFileTypes);
//    
//    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
//    [formater setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
//    path = [NSTemporaryDirectory() stringByAppendingFormat:@"/output-%@.mp4", [formater stringFromDate:[NSDate date]]];
//    exportSession.outputURL = [NSURL fileURLWithPath: path];
//    exportSession.outputFileType = AVFileTypeMPEG4;
//    exportSession.shouldOptimizeForNetworkUse = YES;
//    [exportSession exportAsynchronouslyWithCompletionHandler:^{
//        switch ([exportSession status]) {
//            case AVAssetExportSessionStatusFailed:
//            {
//                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                message:[[exportSession error] localizedDescription]
//                                                               delegate:nil
//                                                      cancelButtonTitle:@"OK"
//                                                      otherButtonTitles: nil];
//                [alert show];
//                break;
//            }
//                
//            case AVAssetExportSessionStatusCancelled:
//                NSLog(@"Export canceled");
//                break;
//            case AVAssetExportSessionStatusCompleted:
//                NSLog(@"Successful!");
//                
//                
//                
//                break;
//            default:
//                break;
//        }
//    }];
//    
//    
//}



// 相册是否可用

- (BOOL) isPhotoLibraryAvailable{
    
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
    
}

// 是否可以在相册中选择视频

- (BOOL) canUserPickVideosFromPhotoLibrary{
    
    return [self cameraSupportsMedia:(__bridge  NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView) name:ALAssetsLibraryChangedNotification object:nil];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ALAssetsLibraryChangedNotification object:nil];
}

- (void)reloadTableView
{
	[self.tableView reloadData];
	//[self.navigationItem setTitle:NSLocalizedString(@"Select an Album", nil)];
}

- (BOOL)shouldSelectAsset:(ELCAsset *)asset previousCount:(NSUInteger)previousCount
{
    return [self.parent shouldSelectAsset:asset previousCount:previousCount];
}

- (BOOL)shouldDeselectAsset:(ELCAsset *)asset previousCount:(NSUInteger)previousCount
{
    return [self.parent shouldDeselectAsset:asset previousCount:previousCount];
}

- (void)selectedAssets:(NSArray*)assets
{
	[_parent selectedAssets:assets];
}

/**
 *  选择返回类型
 *
 *  @return
 */
- (ALAssetsFilter *)assetFilter
{
    if([self.mediaTypes containsObject:(NSString *)kUTTypeImage] && [self.mediaTypes containsObject:(NSString *)kUTTypeMovie])
    {
        return [ALAssetsFilter allAssets];
    }
    else if([self.mediaTypes containsObject:(NSString *)kUTTypeMovie])
    {
        return [ALAssetsFilter allVideos];
    }
    else
    {
        return [ALAssetsFilter allPhotos];
    }
}

#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.assetGroups count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Get count
    ALAssetsGroup *g = (ALAssetsGroup*)[self.assetGroups objectAtIndex:indexPath.row];
    [g setAssetsFilter:[self assetFilter]];
    NSInteger gCount = [g numberOfAssets];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld)",[g valueForProperty:ALAssetsGroupPropertyName], (long)gCount];
    UIImage* image = [UIImage imageWithCGImage:[g posterImage]];
    image = [self resize:image to:CGSizeMake(78, 78)];
    [cell.imageView setImage:image];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
    return cell;
}

// Resize a UIImage.
- (UIImage *)resize:(UIImage *)image to:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	ELCAssetTablePicker *picker = [[ELCAssetTablePicker alloc] initWithNibName: nil bundle: nil];
	picker.parent = self;

    picker.assetGroup = [self.assetGroups objectAtIndex:indexPath.row];
    [picker.assetGroup setAssetsFilter:[self assetFilter]];
    picker.isVideo = _IsOpenedCamera;
	picker.assetPickerFilterDelegate = self.assetPickerFilterDelegate;
	
	[self.navigationController pushViewController:picker animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 95;
}

@end

