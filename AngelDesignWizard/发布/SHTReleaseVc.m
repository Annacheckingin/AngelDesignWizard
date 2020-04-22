//
//  SHTReleaseVc.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTReleaseVc.h"
#import <objc/runtime.h>
@interface SHTReleaseVc ()
@property(nonatomic,strong)UIImageView *topView;
@property(nonatomic,strong)UIImageView *decorationBaseView;
@property(nonatomic,strong)UITextView *inputInforMation;
@property(nonatomic,strong)UIButton *addImage;
@property(nonatomic,strong)UIButton *releaseButton;
@property(nonatomic,strong)NSArray *k_images;
@end
const static char *SHTReleaseVcImageKey="SHTReleaseVcImageKey";
@implementation SHTReleaseVc
-(instancetype)init
{
    if (self=[super init])
    {
        _topView=[[UIImageView alloc]init];
        _topView.userInteractionEnabled=YES;
        _decorationBaseView=[[UIImageView alloc]init];
        _decorationBaseView.userInteractionEnabled=YES;
         _inputInforMation=[[UITextView alloc]init];
        _addImage=[[UIButton alloc]init];
         _releaseButton=[[UIButton alloc]init];
        //
        _topView.image=[SHTReleaseVc theImages][0];
        _topView.userInteractionEnabled=YES;
        _topView.contentMode=UIViewContentModeScaleAspectFill;
        _decorationBaseView.image=[SHTReleaseVc theImages][3];
        _decorationBaseView.contentMode=UIViewContentModeScaleAspectFill;
        _decorationBaseView.userInteractionEnabled=YES;
        [ _addImage setImage:[SHTReleaseVc theImages][1] forState:UIControlStateNormal];
        [_releaseButton setImage:[SHTReleaseVc theImages][2] forState:UIControlStateNormal];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_topView,_decorationBaseView,_releaseButton]];
    [self.decorationBaseView sd_addSubviews:@[_addImage,_inputInforMation]];
    [self k_setUpUi];
    [self backbuttonMoveToPeak];
    
}
-(void)k_setUpUi
{
    _topView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(80*HEIGHT_LzgDevicePixlesHandle);
    //
    _decorationBaseView.sd_layout
    .topSpaceToView(self.view, _topView.height-20*HEIGHT_LzgDevicePixlesHandle)
    .leftSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .rightSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .heightIs(350*HEIGHT_LzgDevicePixlesHandle);
    //
    _releaseButton.sd_layout
    .bottomSpaceToView(self.view, 20*HEIGHT_LzgDevicePixlesHandle)
    .leftSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .rightSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .heightIs(40*HEIGHT_LzgDevicePixlesHandle);
    //
    
    
}
+(NSArray *)theImages
{
   return objc_getAssociatedObject(self, SHTReleaseVcImageKey);
}
+(void)initialize
{
    UIImage *topImage=[UIImage imageNamed:@"1_74"];
    UIImage *btnImage=[UIImage imageNamed:@"1_121"];
    UIImage *okImage=[UIImage imageNamed:@"1_144"];
    UIImage *backwihteImage=[UIImage imageNamed:@"1_95"];
    objc_setAssociatedObject(self, SHTReleaseVcImageKey, @[topImage,btnImage,okImage,backwihteImage], OBJC_ASSOCIATION_RETAIN);
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
