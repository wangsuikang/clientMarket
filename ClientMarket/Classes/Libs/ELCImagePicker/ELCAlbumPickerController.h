//
//  AlbumPickerController.h
//
//  Created by ELC on 2/15/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  判断当前视图的类型
 */
typedef NS_ENUM(NSInteger, controllerType){
    /**
     *  精彩一刻
     */
    controllerWonderful = 110,
    /**
     *  朋友圈
     */
    controllerFriend,
    /**
     *  聊天界面
     */
    controllerChat,
    /**
     *  照片分享
     */
    controllerShareImage
};


typedef void(^showActionSheetBlock)(NSMutableArray *,NSInteger tag);

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ELCAssetSelectionDelegate.h"
#import "ELCAssetPickerFilterDelegate.h"

@interface ELCAlbumPickerController : UITableViewController <ELCAssetSelectionDelegate>

@property (nonatomic, weak) id<ELCAssetSelectionDelegate> parent;
@property (nonatomic, strong) NSMutableArray *assetGroups;
@property (nonatomic, strong) NSArray *mediaTypes;

// optional, can be used to filter the assets displayed
@property (nonatomic, weak) id<ELCAssetPickerFilterDelegate> assetPickerFilterDelegate;

@property (nonatomic,copy) showActionSheetBlock showBlock;

@property (nonatomic,assign) controllerType controllerType;

@property (nonatomic,copy) NSString *navigationBarTitle;

@property (nonatomic,copy) NSString  *mediaType;
@property (nonatomic,strong) NSMutableArray *sendMediaArray;


@end

