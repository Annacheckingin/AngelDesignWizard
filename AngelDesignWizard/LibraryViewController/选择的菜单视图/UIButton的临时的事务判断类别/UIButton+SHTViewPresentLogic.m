//
//  UIButton+SHTViewPresentLogic.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/24.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "UIButton+SHTViewPresentLogic.h"
#import <objc/runtime.h>

#import "Button_LogcMacro.h"
static const char *ButtonSHTViewPresentLogicKey="ButtonSHTViewPresentLogickey";
 ButtonSHTViewPresentLogic ButtonSHTViewPresentLogicMakeWithBOOL(BOOL is)
{
    ButtonSHTViewPresentLogic a;
    int8_t *bv=&a;
    *bv=(*bv)&ButtonSHTViewPresentLogicMaskReverse;
    if (is==YES)
    {
        *bv=(*bv)|ButtonSHTViewPresentLogicMask;
    }
    else
    {
        *bv=(*bv)&ButtonSHTViewPresentLogicMaskReverse;
    }
    
    return a;
}
@implementation UIButton (SHTViewPresentLogic)
-(void)setIsShown:(ButtonSHTViewPresentLogic)isShown
{
    ButtonSHTViewPresentLogic pa=isShown;
    NSValue *valueForStruct=[NSValue valueWithBytes:&pa objCType:@encode(ButtonSHTViewPresentLogic)];
    objc_setAssociatedObject(self, ButtonSHTViewPresentLogicKey, valueForStruct, OBJC_ASSOCIATION_RETAIN);
}
-(ButtonSHTViewPresentLogic)isShown
{
    
    NSValue *theValue=objc_getAssociatedObject(self, ButtonSHTViewPresentLogicKey);
    ButtonSHTViewPresentLogic b;
    [theValue getValue:&b];
    return b;
}
@end
