//
//  AppDelegate.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "AppDelegate.h"
#import "SHTHomeViewController.h"
#import "SHTpersonViewController.h"
#import "SHTLibraryViewController.h"
#import "SHTMainBundleReader.h"
#import "SHTTabBarController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    SHTHomeViewController *homevc=[[SHTHomeViewController alloc]init];
    SHTpersonViewController *personvc=[[SHTpersonViewController alloc]init];
    SHTLibraryViewController *libraryvc=[[SHTLibraryViewController alloc]init];
    UINavigationController *navi_home=[[UINavigationController alloc]initWithRootViewController:homevc];
    UINavigationController *navi_library=[[UINavigationController alloc]initWithRootViewController:libraryvc];
    UINavigationController *navi_personvc=[[UINavigationController alloc]initWithRootViewController:personvc];
    UITabBarController *rootBarVc=[[SHTTabBarController alloc]init];
    rootBarVc.delegate=self;
    rootBarVc.viewControllers=@[navi_home,navi_library,navi_personvc];
    [rootBarVc.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:[[SHTMainBundleReader shareInstance] SHTPlistPathWithName:@"IconImagesSetting"]];
        NSString *formatteNormal=[NSString stringWithFormat:@"tabbar_%ld",idx+1];
         NSString *formatteSelected=[NSString stringWithFormat:@"tabbar_%ld_s",idx+1];
        obj.tabBarItem.selectedImage=[UIImage imageNamed:dic[formatteSelected]];
        obj.tabBarItem.image=[UIImage imageNamed:dic[formatteNormal]];
    }];
    self.window.rootViewController=rootBarVc;
//    
    [self.window makeKeyAndVisible];
//    UINavigationController *navc_home=[UINavigationController alloc]
    // Override point for customization after application launch.
    return YES;
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}




@end
