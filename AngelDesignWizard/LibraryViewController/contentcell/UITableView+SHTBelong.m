//
//  UITableView+SHTBelong.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/27.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "UITableView+SHTBelong.h"
#import <objc/runtime.h>


static const char *SHTBelongKey="SHTBelongKey";
@implementation UITableView (SHTBelong)
-(void)setBelongto:(UIViewController *)belongto
{
    objc_setAssociatedObject(self,SHTBelongKey, belongto, OBJC_ASSOCIATION_ASSIGN);
}
-(UIViewController*)belongto
{
    return objc_getAssociatedObject(self, SHTBelongKey);
}
@end
