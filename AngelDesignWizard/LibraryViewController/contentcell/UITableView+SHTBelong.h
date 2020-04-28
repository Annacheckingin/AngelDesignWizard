//
//  UITableView+SHTBelong.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/27.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (SHTBelong)
@property(nonatomic,weak)UIViewController *belongto;
@end

NS_ASSUME_NONNULL_END
