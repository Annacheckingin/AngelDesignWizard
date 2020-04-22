//
//  SHTMainBundleReader.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTMainBundleReader.h"
#import <UIKit/UIKit.h>
@implementation SHTMainBundleReader
-(NSBundle*)k_bundle
{
    NSBundle *mainBundle=[NSBundle mainBundle];
    return mainBundle;
}
+(instancetype)shareInstance
{
//    __block id me;
//    dispatch_once_t once;
//    dispatch_once(&once, ^
//    {
//        if (me==nil)
//        {
//            me =[[SHTMainBundleReader alloc]init];
//        }
//    });
//    return me;
    
    
    SHTMainBundleReader *me;
    if (me==nil)
    {
        me=[[SHTMainBundleReader alloc]init];
    }
    return me;
}
-(UIImage *)SHTImageWithName:(NSString *)name
{
  NSString *filePath= [[self k_bundle] pathForResource:name ofType:@""];
    return  [UIImage imageWithContentsOfFile:filePath];
}
-(NSString *)SHTPlistPathWithName:(NSString *)name
{
    NSString *fileToPlist=[[self k_bundle] pathForResource:name ofType:@"plist"];
//    NSLog(@"%s,%@,filePath:%@",sel_getName(_cmd),name,fileToPlist);
    return fileToPlist;
}
@end
