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
//    NSLog(@"deviceName;%ld",[self p_findScreenInfor]);
//    NSLog(@"%@",k_LzgDevicePixlesHandleHardInformation);
    return k_LzgDevicePixlesHandleHardInformation[[self p_findScreenInfor]];
}
-(NSInteger)p_findScreenInfor
{
//   NSDictionary *curentDeviceinfor=@{
//        LzgDevicePixlesHandleSCREENWIDTHKEY:[NSNumber numberWithFloat:SCREENWIDTH_SHT],
//        LzgDevicePixlesHandleSCREENHEIGHTKEY:[NSNumber numberWithFloat:SCREENHEIGHT_SHT]
//    };
   __block NSInteger indexInofr;
//    NSLog(@"here:%@",k_LzgDevicePixlesHandleHardNumericInfor);
    [k_LzgDevicePixlesHandleHardNumericInfor enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        NSDictionary *dic=(NSDictionary *)obj;
//
        NSNumber *width=dic[LzgDevicePixlesHandleSCREENWIDTHKEY];
        NSNumber *height=dic[LzgDevicePixlesHandleSCREENHEIGHTKEY];
//        NSNumber *width_current=curentDeviceinfor[LzgDevicePixlesHandleSCREENWIDTHKEY];
//        NSNumber *height_current=curentDeviceinfor[LzgDevicePixlesHandleSCREENHEIGHTKEY];
//        CGFloat width_f=width.floatValue;
//        CGFloat height_f=height.floatValue;
//        CGFloat width_c=width_current.floatValue;
//        CGFloat height_c=height_current.floatValue;
        if (width.floatValue==[UIScreen mainScreen].bounds.size.width&&height.floatValue==[UIScreen mainScreen].bounds.size.height)
        {
            indexInofr=idx;
            *stop=YES;
        }
    }];
//    NSLog(@"indexinfor:%d",indexInofr);
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

    SCREENWIDTH_SHT=[[self shareInstance] widthWithDevice:[[self shareInstance] deviceName]];
       
    SCREENHEIGHT_SHT=[[self shareInstance] heightWithDeviceName:[[self shareInstance] deviceName]];
    
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
//    NSLog(@"%@",k_LzgDevicePixlesHandleHardInformation);
//    NSLog(@"deviceName:%@",[[self shareInstance] deviceName]);
//
//    NSLog(@"initialize:%lf",SCREENWIDTH_SHT);
//    NSLog(@"compared;%lf",[UIScreen mainScreen].bounds.size.width);
}
@end
