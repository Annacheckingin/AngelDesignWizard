//
//  SHTBaseViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTBaseViewControllerWithBackBtn.h"
#import <objc/runtime.h>
#import "SHTMainBundleReader.h"
@interface SHTBaseViewControllerWithBackBtn ()
@property(nonatomic,strong)UIButton *backButton;
//@property(nonatomic,strong,nullable)UIImage *k_image;
@end
static const char *SHTBaseViewControllerWithBackBtnImageKey="SHTBaseViewControllerWithBackBtnImageKey";
static const NSString *SHTBackBtnImageNameKey=@"backBtnImage";
@implementation SHTBaseViewControllerWithBackBtn
-(instancetype)init
{
    if (self=[super init])
    {
        self.navigationController.navigationBar.hidden=YES;
        self.hidesBottomBarWhenPushed=YES;
        _backButton=[[UIButton alloc]init];
        [_backButton addTarget:self action:@selector(k_back:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *backBtnImage=[SHTBaseViewControllerWithBackBtn backButtonImage];
//        NSLog(@"imagedescription:%@",backBtnImage);;
        [_backButton setImage:backBtnImage forState:UIControlStateNormal];
        _backButton.imageView.contentMode=UIViewContentModeScaleAspectFit;
//        _backButton.backgroundColor=[UIColor colorWithRed:97/255.0 green:117/255.0 blue:174/255.0 alpha:1];
    }
    return self;
}
-(void)backbuttonMoveToPeak
{
    [self.view bringSubviewToFront:_backButton];
}
-(void)k_back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
+(UIImage *)backButtonImage
{
    return objc_getAssociatedObject(self, SHTBaseViewControllerWithBackBtnImageKey);
}
+(void)configureTheBackBtnImage:(UIImage *)image
{
    objc_setAssociatedObject(self, SHTBaseViewControllerWithBackBtnImageKey, image, OBJC_ASSOCIATION_RETAIN);
}
-(void)setExceptionBackImage:(UIImage *)image
{
    [_backButton setImage:image forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_backButton];
    _backButton.sd_layout
    .leftSpaceToView(self.view,10*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.view, 40*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(50*WIDTH_LzgDevicePixlesHandle)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    // Do any additional setup after loading the view.
}
+(void)initialize
{
    
    SHTMainBundleReader *bundleRd=[SHTMainBundleReader shareInstance];
    NSString *picName=[bundleRd SHTPlistPathWithName:IconImagesSettingName];

    NSDictionary *setting=[NSDictionary dictionaryWithContentsOfFile:picName];

    [self configureTheBackBtnImage:[UIImage imageNamed:setting[SHTBackBtnImageNameKey]]];
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
