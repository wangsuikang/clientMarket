//
//  ELCImagePickerController.m
//  ELCImagePickerDemo
//
//  Created by ELC on 9/9/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "ELCImagePickerController.h"
#import "ELCAsset.h"
#import "ELCAssetCell.h"
#import "ELCAssetTablePicker.h"
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "ELCConsole.h"
#import "MacroDefinition.h"

@implementation ELCImagePickerController

//Using auto synthesizers

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_CHANGEELC_Count object:nil];
    
}

- (id)initImagePicker
{
    _calbumPickerController = [[ELCAlbumPickerController alloc] initWithStyle:UITableViewStylePlain];
    
    self = [super initWithRootViewController:_calbumPickerController];
    if (self) {
        self.maximumImagesCount = 9;
        self.returnsImage = YES;
        self.returnsOriginalImage = YES;
        [_calbumPickerController setParent:self];
        self.mediaTypes = @[(NSString *)kUTTypeMovie];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeMaxCount:) name:NOTIFICATION_CHANGEELC_Count object:nil];
    }
    return self;
}

-(void)changeMaxCount:(NSNotification *)notification{
    
    NSNumber *number = notification.object;
    if ([number isEqualToNumber:@0]) {
        self.maximumImagesCount = 9;
    }else{
        self.maximumImagesCount = 1;
    }
    
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{

    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.maximumImagesCount = 9;
        self.returnsImage = YES;
    }
    return self;
}

- (ELCAlbumPickerController *)albumPicker
{
    return self.viewControllers[0];
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
    self.albumPicker.mediaTypes = mediaTypes;
}

- (NSArray *)mediaTypes
{
    return self.albumPicker.mediaTypes;
}

- (void)cancelImagePicker
{
	if ([_imagePickerDelegate respondsToSelector:@selector(elcImagePickerControllerDidCancel:)]) {
		[_imagePickerDelegate performSelector:@selector(elcImagePickerControllerDidCancel:) withObject:self];
	}
}

- (BOOL)shouldSelectAsset:(ELCAsset *)asset previousCount:(NSUInteger)previousCount
{
    BOOL shouldSelect = previousCount < self.maximumImagesCount;
    if (!shouldSelect) {
        //NSString *title = [NSString stringWithFormat:NSLocalizedString(@"最多选择%d张 !", nil), self.maximumImagesCount];
        NSString *message;
        if ([self.mediaTypes isEqualToArray:@[(NSString *)kUTTypeMovie]]) {
            message = [NSString stringWithFormat:NSLocalizedString(@" 最多选择%d个视频", nil), self.maximumImagesCount];
        }else{
            message = [NSString stringWithFormat:NSLocalizedString(@" 最多选择%d张图片", nil), self.maximumImagesCount];
        }
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:message
                                   delegate:nil
                          cancelButtonTitle:nil
                          otherButtonTitles:NSLocalizedString(@"确定", nil), nil] show];
    }
    return shouldSelect;
}

- (BOOL)shouldDeselectAsset:(ELCAsset *)asset previousCount:(NSUInteger)previousCount;
{
    return YES;
}

- (void)selectedAssets:(NSArray *)assets
{
	NSMutableArray *returnArray = [[NSMutableArray alloc] init];
	
    [SVProgressHUD showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeClear];
    sw_dispatch_async_on_background_thread(^{
        for(ELCAsset *elcasset in assets) {
            ALAsset *asset = elcasset.asset;
            id obj = [asset valueForProperty:ALAssetPropertyType];
            if (!obj) {
                continue;
            }
            NSMutableDictionary *workingDictionary = [[NSMutableDictionary alloc] init];
            
            CLLocation* wgs84Location = [asset valueForProperty:ALAssetPropertyLocation];
            if (wgs84Location) {
                [workingDictionary setObject:wgs84Location forKey:ALAssetPropertyLocation];
            }
            
            [workingDictionary setObject:obj forKey:UIImagePickerControllerMediaType];
            
            //This method returns nil for assets from a shared photo stream that are not yet available locally. If the asset becomes available in the future, an ALAssetsLibraryChangedNotification notification is posted.
            ALAssetRepresentation *assetRep = [asset defaultRepresentation];
            
            if(assetRep != nil) {
                if (_returnsImage) {
                    CGImageRef imgRef = nil;
                    //defaultRepresentation returns image as it appears in photo picker, rotated and sized,
                    //so use UIImageOrientationUp when creating our image below.
                    UIImageOrientation orientation = UIImageOrientationUp;
                    
                    if (_returnsOriginalImage) {
                        imgRef = [assetRep fullResolutionImage];
                        orientation = [assetRep orientation];
                    } else {
                        imgRef = [assetRep fullScreenImage];
                    }
                    UIImage *img = [UIImage imageWithCGImage:imgRef
                                                       scale:1.0f
                                                 orientation:orientation];
                    [workingDictionary setObject:img forKey:UIImagePickerControllerOriginalImage];
                }
                
                [workingDictionary setObject:[[asset valueForProperty:ALAssetPropertyURLs] valueForKey:[[[asset valueForProperty:ALAssetPropertyURLs] allKeys] objectAtIndex:0]] forKey:UIImagePickerControllerReferenceURL];
                
                [returnArray addObject:workingDictionary];
            }
            
        }
        sw_dispatch_sync_on_main_thread(^{
            [SVProgressHUD dismiss];
            if (_imagePickerDelegate != nil && [_imagePickerDelegate respondsToSelector:@selector(elcImagePickerController:didFinishPickingMediaWithInfo:)]) {
                [_imagePickerDelegate performSelector:@selector(elcImagePickerController:didFinishPickingMediaWithInfo:) withObject:self withObject:returnArray];
            } else {
                [self popToRootViewControllerAnimated:NO];
            }

        });
    });
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    } else {
        return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    }
}

-(BOOL)shouldAutorotate{
    return NO;
}

- (BOOL)onOrder
{
    return [[ELCConsole mainConsole] onOrder];
}

- (void)setOnOrder:(BOOL)onOrder
{
    [[ELCConsole mainConsole] setOnOrder:onOrder];
}

@end
