//
//  SHTBaseViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTBaseViewController.h"
typedef struct k_judgePlace
{
    bool k_judgePlace :1;
}k_judgePlace;
@interface SHTBaseViewController ()

@property(nonatomic,assign)k_judgePlace k_isLoadView;
-(void)k_setTheJudgeplace:(k_judgePlace) par;
@end
#pragma mark C语言方法

static k_judgePlace k_judgePlaceWithBool(bool logicPara)
{
    k_judgePlace a;
    a.k_judgePlace=logicPara;
    return a;
}
@implementation SHTBaseViewController
#pragma mark 内部方法
-(void)setUpUi
{
    
}
-(void)k_setTheJudgeplace:(k_judgePlace)par
{
    _k_isLoadView=par;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.k_isLoadView=k_judgePlaceWithBool(1);
    // Do any additional setup after loading the view.
}
-(void)theViewAddSubViews:(NSArray<UIView *> *)subViews
{
    if (self.k_isLoadView.k_judgePlace!=k_judgePlaceWithBool(1).k_judgePlace)
    {
        @throw [NSException exceptionWithName:@"function early called" reason:@"the view hasn't load yet" userInfo:nil];
    }
    [subViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        [self.view addSubview:obj];
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
