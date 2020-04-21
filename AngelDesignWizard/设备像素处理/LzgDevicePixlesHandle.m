//
//  LzgDevicePixlesHandle.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
#define LzgDevicePixlesHandleSCREENWIDTHKEY @"WIDTH"
#define LzgDevicePixlesHandleSCREENHEIGHTKEY @"HEIGHT"
#import "LzgDevicePixlesHandle.h"
static const NSArray *k_LzgDevicePixlesHandleHardInformation;
static const NSArray *k_LzgDevicePixlesHandleHardNumericInfor;
const NSString * LzgDevicePixlesHandleIphone8=@"iphone8";
const NSString *LzgDevicePixlesHandleIphone8plus=@"iphone8plus";
const NSString *LzgDevicePixlesHandleIphone11=@"iphone11";
const NSString *LzgDevicePixlesHandleIphone11Pro=@"iphone11Pro";
const NSString *LzgDevicePixlesHandleIphone11ProMax=@"iphone11ProMax";
float WIDTH_LzgDevicePixlesHandle=1;
float HEIGHT_LzgDevicePixlesHandle=1;
float SCREENWIDTH_SHT;
float SCREENHEIGHT_SHT;
@implementation LzgDevicePixlesHandle
-(NSString *)deviceName
{
    return k_LzgDevicePixlesHandleHardInformation[[self p_findScreenInfor]];
}
-(NSInteger)p_findScreenInfor
{
   NSDictionary *curentDeviceinfor=@{
        LzgDevicePixlesHandleSCREENWIDTHKEY:[NSNumber numberWithFloat:WIDTH_LzgDevicePixlesHandle],
        LzgDevicePixlesHandleSCREENHEIGHTKEY:[NSNumber numberWithFloat:HEIGHT_LzgDevicePixlesHandle]
    };
   __block NSInteger indexInofr;
    [k_LzgDevicePixlesHandleHardNumericInfor enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSDictionary *dic=(NSDictionary *)obj;
        if ([dic isEqualToDictionary:curentDeviceinfor])
        {
            indexInofr=idx;
            *stop=YES;
        }
    }];
    return indexInofr;
}
-(CGFloat)heightWithDeviceName:(NSString *)deviceName
{
    __block  NSInteger index;
    [k_LzgDevicePixlesHandleHardInformation enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
        NSString *stringObj=(NSString *)obj;
        if ([stringObj isEqualToString:deviceName])
        {
            index=idx;
            *stop=YES;
        }
    }];
    NSDictionary *dic=k_LzgDevicePixlesHandleHardNumericInfor[index];
    NSNumber *objNum=dic[LzgDevicePixlesHandleSCREENHEIGHTKEY];
    return objNum.floatValue;
    
}
-(CGFloat)widthWithDevice:(NSString *)deviceName
{
    __block  NSInteger index;
    [k_LzgDevicePixlesHandleHardInformation enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
        NSString *stringObj=(NSString *)obj;
        if ([stringObj isEqualToString:deviceName])
        {
            index=idx;
            *stop=YES;
        }
    }];
    NSDictionary *dic=k_LzgDevicePixlesHandleHardNumericInfor[index];
    NSNumber *objNum=dic[LzgDevicePixlesHandleSCREENWIDTHKEY];
    return objNum.floatValue;
}
+(instancetype)shareInstance
{
    static LzgDevicePixlesHandle *me;
    if (me==nil)
    {
        me=[[LzgDevicePixlesHandle alloc]init];
    }
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
k_LzgDevicePixlesHandleHardInformation=@[@"iphone8",@"iphone8plus",@"iphone11",@"iphone11Pro",@"iphone11ProMax"];
        k_LzgDevicePixlesHandleHardNumericInfor=@[

             @{LzgDevicePixlesHandleSCREENWIDTHKEY:@375.0,
             LzgDevicePixlesHandleSCREENHEIGHTKEY:@667.0},
            @{LzgDevicePixlesHandleSCREENWIDTHKEY:@414,
              LzgDevicePixlesHandleSCREENHEIGHTKEY:@736
            },
            @{
                LzgDevicePixlesHandleSCREENWIDTHKEY:@414,
                LzgDevicePixlesHandleSCREENHEIGHTKEY:@896
            },
            @{
                LzgDevicePixlesHandleSCREENWIDTHKEY:@375
                ,
                LzgDevicePixlesHandleSCREENHEIGHTKEY:@812
            },
            @{
                LzgDevicePixlesHandleSCREENWIDTHKEY:@414
                ,LzgDevicePixlesHandleSCREENHEIGHTKEY:@896
            }
        ];
    }
    return self;
}
+(void)initialize
{

    if ([[[self shareInstance] deviceName] isEqualToString:LzgDevicePixlesHandleIphone8])
    {
        WIDTH_LzgDevicePixlesHandle=1;
        HEIGHT_LzgDevicePixlesHandle=1;
        
    }
    else if ([[[self shareInstance] deviceName] isEqualToString:LzgDevicePixlesHandleIphone8plus])
    {
        
        HEIGHT_LzgDevicePixlesHandle=1;
        WIDTH_LzgDevicePixlesHandle=1.1;
    }
    else if ([[[self shareInstance] deviceName] isEqualToString:LzgDevicePixlesHandleIphone11])
    {
        WIDTH_LzgDevicePixlesHandle=1;
        HEIGHT_LzgDevicePixlesHandle=1.3;
    }
    else if ([[[self shareInstance] deviceName] isEqualToString:LzgDevicePixlesHandleIphone11Pro])
    {
        WIDTH_LzgDevicePixlesHandle=1;
        HEIGHT_LzgDevicePixlesHandle=1.2;
    }
    else if ([[[self shareInstance] deviceName] isEqualToString:LzgDevicePixlesHandleIphone11ProMax])
    {
        WIDTH_LzgDevicePixlesHandle=1.1;
        HEIGHT_LzgDevicePixlesHandle=1.3;
    }
    
    SCREENWIDTH_SHT=[[self shareInstance] widthWithDevice:[[self shareInstance] deviceName]];
    SCREENHEIGHT_SHT=[[self shareInstance] heightWithDeviceName:[[self shareInstance] deviceName]];
}
@end
