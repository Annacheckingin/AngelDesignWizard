//
//  SHTHomeViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTHomeViewController.h"
#import "SHTCollectionViewLayout.h"
#import "SHTReleaseVc.h"
#import "HomeViewControllerCollectionViewCell.h"
@interface SHTHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *theme;
@property(nonatomic,strong)UILabel *subtitle;
@property(nonatomic,strong)UIButton *publishButton;
@property(nonatomic,strong)UICollectionView *gridDisplay;
@property(nonatomic,strong)NSMutableArray *collectionViewData;
@end



@implementation SHTHomeViewController
#pragma mark UICollectionView的数据源

-(instancetype)init
{
    if (self=[super init])
    {
#pragma mark 分配内存
        _theme=[[UILabel alloc]init];
        _subtitle=[[UILabel alloc]init];
        SHTCollectionViewLayout *layout=[[SHTCollectionViewLayout alloc]init];
        layout.theItemSize=CGSizeMake(SCREENWIDTH_SHT-40, SCREENWIDTH_SHT-40+90);
        layout.sectionEdgeinsect=UIEdgeInsetsMake(10, 20, 10, 20);
        layout.theItemGap=10;
        layout.scrollDirection=SHTScrollDirectionVertical;
        _gridDisplay=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
       _publishButton=[[UIButton alloc]init];
        [_gridDisplay registerClass:[HomeViewControllerCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionViewCell class])];
        _gridDisplay.showsVerticalScrollIndicator=NO;
        _gridDisplay.showsHorizontalScrollIndicator=NO;
        _collectionViewData=[NSMutableArray array];
#pragma mark 绑定数据源和代理
        //
        //
        _gridDisplay.delegate=self;
        _gridDisplay.dataSource=self;
        //
#pragma mark UI设计
        //
        //
        
        _publishButton.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _theme.text=@"Interior design inspiration";
        _theme.font=[UIFont fontWithName:@"Arial-BoldMT" size:25];
        [_publishButton setImage:[UIImage imageNamed:@"1_03"] forState:UIControlStateNormal];
        [_publishButton addTarget:self action:@selector(k_publishAction:) forControlEvents:UIControlEventTouchUpInside];
        _subtitle.text=@"up to date 23 March";
        _subtitle.font=[UIFont fontWithName:@"CourierNewPSMT" size:12];
        _subtitle.textColor=UIColor.lightGrayColor;
        _gridDisplay.backgroundColor=[UIColor colorWithRed:245/255.0 green:247/255.0 blue:250/255.0 alpha:1];
//        _gridDisplay.backgroundColor=UIColor.greenColor;
     
    }
    return self;
}
-(void)k_publishAction:(UIButton *)sender
{
    SHTReleaseVc *vc=[[SHTReleaseVc alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
   [self theViewAddSubViews:@[_theme,_subtitle,_publishButton,_gridDisplay]];
   [self setUpUi];
    // Do any additional setup after loading the view.
}
-(void)setUpUi
{
    _theme.sd_layout
    .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.view, 80*HEIGHT_LzgDevicePixlesHandle)
    .heightIs(40*HEIGHT_LzgDevicePixlesHandle);
    [_theme setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH_SHT-100*WIDTH_LzgDevicePixlesHandle];
    //
    _subtitle.sd_layout
    .topSpaceToView(_theme, 10*HEIGHT_LzgDevicePixlesHandle)
    .leftEqualToView(_theme)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_subtitle setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH_SHT-80*WIDTH_LzgDevicePixlesHandle];
    //
    _publishButton.sd_layout
    .rightSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
    .widthIs(50*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(_theme, 1)
    .heightEqualToWidth();
    //
    
    _gridDisplay.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(_publishButton, 20*HEIGHT_LzgDevicePixlesHandle)
    .bottomSpaceToView(self.view, 0);
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark 提供UICollectionViewCell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionViewCell class]) forIndexPath:indexPath];
//    cell.contentView.backgroundColor=UIColor.redColor;
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
