//
//  MyselfViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "MyselfViewController.h"
#import "MyselfCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "ELCImagePickerController.h"
#import "MediaUtil.h"
#import "ModifyUserInfoViewController.h"
#import "ChargeGoodsViewController.h"

@interface MyselfViewController ()<ELCImagePickerControllerDelegate,UIImagePickerControllerDelegate> {
    ELCImagePickerController *imagePickerController;
    UIView *_coverView;
    
}

@end

@implementation MyselfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation:@"我的资料"];
    _markNumber = [NSNumber numberWithInt:1];
    [self createTabView];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight)];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
}

- (void)loginOutClick {
    NSLog(@"退出登录");
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 80;
    } else {
        return 50;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"MyselfCell";
    
    NSArray *array = @[@"头像",@"用户名",@"收货地址",@"修改密码",@"修改手机号"];
    MyselfCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MyselfCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.typeLabel.text = array[indexPath.row];
    cell.leftImage.image = [UIImage imageNamed:@"account_normal"];
    
    [cell.rightButton setTitle:array[indexPath.row] forState:UIControlStateNormal];
    cell.rightButton.backgroundColor = [UIColor redColor];
    if (indexPath.row == 0) {
        cell.leftImage.frame = CGRectMake(20, (80 - 20) / 2, 20, 20);
        cell.typeLabel.frame = CGRectMake(CGRectGetMaxX(cell.leftImage.frame) + 10, (80 - 20) / 2, 130, 20);
        cell.rightButton.frame = CGRectMake(SCREEN_WIDTH - 20 - 80, 10, 60, 60);
    } else {
        cell.rightButton.frame = CGRectMake(SCREEN_WIDTH - 20 - 130, 10, 120, 30);
    }
    
    cell.rightButton.tag = 201 + indexPath.row;
    [cell.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
    } else {
        
    }
}

- (void)rightButtonClick:(UIButton *)button {
    switch (button.tag) {
        case 201: {
            [self createActionSheet];
        }
            break;
        case 202: {
            ModifyUserInfoViewController *mvc = [[ModifyUserInfoViewController alloc]init];
            mvc.modifyType = @"userName";
            [self.navigationController pushViewController:mvc animated:YES];
        }
            break;
        case 203: {
            ChargeGoodsViewController *cvc = [[ChargeGoodsViewController alloc]init];
            [self.navigationController pushViewController:cvc animated:YES];
        }
            break;
        case 204: {
            ModifyUserInfoViewController *mvc = [[ModifyUserInfoViewController alloc]init];
            mvc.modifyType = @"passWord";
            [self.navigationController pushViewController:mvc animated:YES];
        }
            break;
        case 205: {
            ModifyUserInfoViewController *mvc = [[ModifyUserInfoViewController alloc]init];
            mvc.modifyType = @"userMobile";
            [self.navigationController pushViewController:mvc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)createActionSheet {
    
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取",nil];
    _coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _coverView.backgroundColor = [UIColor grayColor];
    _coverView.alpha = 0.7;
    [choiceSheet showInView:self.view];
    [self.view addSubview:_coverView];
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable {
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) canUserPickVideosFromPhotoLibrary {
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) canUserPickPhotosFromPhotoLibrary {
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]) {
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark - 移除view
- (void)removeView {
    
    [_coverView removeFromSuperview];
}

#pragma mark - 设置相机和图片列表
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self removeView];
    NSUInteger sourceType = 0;
    if (buttonIndex == 0) {
        [self takingCameraPhotograph];//拍照
    } else if (buttonIndex == 1) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController = [[ELCImagePickerController alloc]initImagePicker];
        imagePickerController.imagePickerDelegate = self;
        imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
        
        if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:1]]) {
            imagePickerController.maximumImagesCount = 1;
        } else if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:0]]) {
            imagePickerController.maximumImagesCount = 9;
        }
        
        imagePickerController.returnsOriginalImage = NO;
        imagePickerController.returnsImage = NO;
        imagePickerController.onOrder = YES;
        imagePickerController.calbumPickerController.controllerType = controllerFriend;
        [self presentViewController:imagePickerController animated:YES completion:nil];
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
        
        //NSLog(@"Camera is not available.");
        
    }
}

#pragma mark - ELCImagePickerController Delegate
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
    //点击完成之后调用的函数
    //[self showShareList];
    //NSMutableArray  *picInfoList = [NSMutableArray arrayWithArray:info];
    //存储所有的选择的图片数组
    
    if (info.count==0) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"请选择图片" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        alert.tag = 10000;
        [alert show];
        return;
    }
    
//    [SVProgressHUD showWithStatus:@"正在加载图片..." maskType:SVProgressHUDMaskTypeClear];
    
//    SendSelfMessageController *svc = [[SendSelfMessageController alloc]init];
    ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
    
    [info enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *dict = obj;
        [assetLibrary assetForURL:[dict valueForKey:UIImagePickerControllerReferenceURL] resultBlock:^(ALAsset *asset) {
            
            if (asset) {
                if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:0]]) {
                    [self getMediaAndSaved:asset index:idx count:info.count];
                } else if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:1]]) {
                    [self getMediaAndSaved:asset index:idx count:info.count];
                }
            } else {
                
                [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                    
                    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                        if([result.defaultRepresentation.url isEqual:[dict valueForKey:UIImagePickerControllerReferenceURL]])
                        {
                            if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:0]]) {
                                [self getMediaAndSaved:result index:idx count:info.count];
                            } else if ([_markNumber isEqualToNumber:[NSNumber numberWithInt:1]]) {
                                [self getMediaAndSaved:result index:idx count:info.count];
                            }
                        }
                    }];
                } failureBlock:^(NSError *error) {
                    NSLog(@"Error: Cannot load asset from photo stream :%@",[error localizedDescription]);
                }];
                
            }
        } failureBlock:^(NSError *err) {
            
        }];
    }];
}

-(void)getMediaAndSaved:(ALAsset *)result index:(NSInteger)index count:(NSInteger)count {
    
    ALAssetRepresentation *rep = [result defaultRepresentation];
    Byte *buffer = (Byte*)malloc(rep.size);
    NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
    
    NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
    //this is NSData may be what you want
    
    UIImage *image  = [UIImage imageWithData:data];

    [imagePickerController dismissViewControllerAnimated:YES completion:^{
        [self savePhoto:image ToPath:[NSString stringWithFormat:@"%@",[NSDate date]]];
    }];
}

/**
 * Called when image selection was cancelled, by tapping the 'Cancel' BarButtonItem.
 */
- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)savePhoto:(UIImage *)photo ToPath:(NSString *)name
{
    //此处首先指定了图片存取路径（默认写到应用程序沙盒 中）
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    //并给文件起个文件名
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:name];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    if (blHave) {
        //NSLog(@"already have");
        //delete
        //[self deleteFromName:name];
    }
    NSData *data = UIImageJPEGRepresentation(photo, 1);
    BOOL result = [data writeToFile:uniquePath atomically:YES];
    if (result) {
        return YES;
    }else {
        return NO;
    }
}

- (UIImage *)getPhotoFromName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *uniquePath=[[paths objectAtIndex:0] stringByAppendingPathComponent:name];
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:uniquePath];
    if (!blHave) {
        return nil;
    } else {
        NSData *data = [NSData dataWithContentsOfFile:uniquePath];
        UIImage *img = [[UIImage alloc] initWithData:data];
        return img;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
