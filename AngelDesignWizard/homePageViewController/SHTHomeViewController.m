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
#import "SHTFlowLayout.h"
#import "SHTPlistDataHandle.h"
#import "SHTHomeDetailsVc.h"
#import "NSString+SHTHeight.h"
#import "SHTLabel.h"
@interface SHTHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *theme;
@property(nonatomic,strong)UILabel *subtitle;
@property(nonatomic,strong)UIButton *publishButton;
@property(nonatomic,strong)UICollectionView *gridDisplay;
@property(nonatomic,strong)NSMutableArray *collectionViewData;
@property(nonatomic,assign)BOOL isReResh;
@end



@implementation SHTHomeViewController
#pragma mark UICollectionView的数据源

-(void)k_NewData
{
    SHTPlistDataHandle *plsthandle=[SHTPlistDataHandle shareInstance];
    NSDictionary *dic=[plsthandle fetchDataWithKey:@"Home"];
//    NSLog(@"reFresh:%@",dic);
    _collectionViewData=[NSMutableArray arrayWithArray:dic[@"collectionViewData"]];
//    NSLog(@"%@",_collectionViewData);
    [_gridDisplay reloadData];
    _isReResh=NO;
}
-(instancetype)init
{
    if (self=[super init])
    {
#pragma mark 分配内存
        _collectionViewData=[NSMutableArray array];
        _isReResh=YES;
        _theme=[[UILabel alloc]init];
        _subtitle=[[UILabel alloc]init];
//        SHTCollectionViewLayout *layout=[[SHTCollectionViewLayout alloc]init];
//        layout.theItemSize=CGSizeMake(SCREENWIDTH_SHT-40, SCREENWIDTH_SHT-40+90);
//        layout.sectionEdgeinsect=UIEdgeInsetsMake(20, 20, 10, 20);
//        layout.theItemGap=10;
//        layout.cellOffset=30;
//        layout.cellScale=0.1;
//        layout.scrollDirection=SHTScrollDirectionVertical;
//        _gridDisplay=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        UICollectionViewFlowLayout *flowLayout=[[SHTFlowLayout alloc]init];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing=10;
        flowLayout.itemSize=CGSizeMake(SCREENWIDTH_SHT-20*WIDTH_LzgDevicePixlesHandle, SCREENHEIGHT_SHT-(171+100)*HEIGHT_LzgDevicePixlesHandle);
       
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
    _gridDisplay=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
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
    [_theme setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH_SHT-2*WIDTH_LzgDevicePixlesHandle];
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
    if (_isReResh==YES)
    {
         [self k_NewData];
    }
   
}

#pragma mark 提供UICollectionViewCell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeViewControllerCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionViewCell class]) forIndexPath:indexPath];
    NSDictionary *cellInfor=[_collectionViewData objectAtIndex:indexPath.row];
    NSURL *picUrl=[NSURL URLWithString:[cellInfor objectForKey:@"LargePic"]];
    [cell.mainDisplayPic yy_setImageWithURL:picUrl placeholder:[UIImage imageNamed:@"placeholder.png"]];
   [cell.authorPortrait yy_setImageWithURL:cellInfor[@"portrait"] placeholder:[UIImage imageNamed:@"placeholder.png"]];
    cell.authorName.text=cellInfor[@"author"];
    cell.theme.text=cellInfor[@"briefIntro"];
    
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SHTHomeDetailsVc *vc=[[SHTHomeDetailsVc alloc]init];
    UIImage *placeImage=[UIImage imageNamed:@"placeholder.png"];
    NSDictionary *cellInfor=[_collectionViewData objectAtIndex:indexPath.row];
    vc.contentMake = ^(UIImageView * _Nonnull topimage, UILabel * _Nonnull pagetitle, UIImageView * _Nonnull portrait, UILabel * _Nonnull name, UIImageView * _Nonnull L_T, UIImageView * _Nonnull L_D, UIImageView * _Nonnull R_T, UIImageView * _Nonnull R_D, SHTLabel * _Nonnull breifContent)
    {
        [topimage yy_setImageWithURL:cellInfor[@"LargePic"] placeholder:placeImage];
    
        pagetitle.text=cellInfor[@"briefIntro"];
        [portrait yy_setImageWithURL:cellInfor[@"portrait"] placeholder:placeImage];
        name.text=cellInfor[@"author"];
        
        [L_T yy_setImageWithURL:cellInfor[@"img1"] placeholder:placeImage];
        [L_D yy_setImageWithURL:cellInfor[@"img2"] placeholder:placeImage];
        [R_T yy_setImageWithURL:cellInfor[@"img3"] placeholder:placeImage];
        [R_D yy_setImageWithURL:cellInfor[@"img4"] placeholder:placeImage];
        breifContent.numberOfLines=0;
        NSLog(@"preseting!");
        breifContent.text=cellInfor[@"intro"];
        
    };
    [self.navigationController pushViewController:vc animated:YES];
}
@end
