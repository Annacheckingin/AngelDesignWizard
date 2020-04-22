//
//  SHTBaseViewController.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHTBaseViewControllerWithBackBtn : UIViewController
+(void)configureTheBackBtnImage:(UIImage *)image;
-(void)setExceptionBackImage:(UIImage *)image;
-(void)backbuttonMoveToPeak;
@property(nonatomic,readonly)UIButton *backButton;
@end

NS_ASSUME_NONNULL_END
