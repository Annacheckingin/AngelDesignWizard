//
//  UIButton+SHTViewPresentLogic.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/24.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct
{
    char logicJudge;
}ButtonSHTViewPresentLogic;

ButtonSHTViewPresentLogic ButtonSHTViewPresentLogicMakeWithBOOL(BOOL is);
@interface UIButton (SHTViewPresentLogic)
@property(nonatomic,assign)ButtonSHTViewPresentLogic isShown;
@end

NS_ASSUME_NONNULL_END
