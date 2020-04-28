//
//  NSString+SHTHeight.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SHTHeight)
+(instancetype)shareInstance;
-(CGFloat)sHTHeightInWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
