//
//  NSString+SHTHeight.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "NSString+SHTHeight.h"




@implementation NSString (SHTHeight)
+(instancetype)shareInstance
{
  static  id me;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        me=[[self alloc]init];
    });
    return me;
}
-(CGFloat)sHTHeightInWidth:(CGFloat)width
{
    CGSize theStringSize=[self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
    return theStringSize.height;
}
@end
