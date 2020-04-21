//
//  HomeViewControllerCollectionViewCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/16.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "HomeViewControllerCollectionViewCell.h"
@interface HomeViewControllerCollectionViewCell()
@property(nonatomic,strong)UILabel *authorName;
@property(nonatomic,strong)UIImageView *authorPortrait;
@property(nonatomic,strong)UIImageView *mainDisplayPic;
@property(nonatomic,strong)UILabel *theme;
@property(nonatomic,strong)UILabel *addtionalContent;
@property(nonatomic,strong)UILabel *latestTime;
@property(nonatomic,strong)UIButton *viewMore;
@property(nonatomic,strong)UIButton *likeIt;
@property(nonatomic,strong)UIView *k_baseOutLinView;
@end
@implementation HomeViewControllerCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        _likeIt=[[UIButton alloc]init];
        _k_baseOutLinView=[[UIView alloc]init];
        _authorName=[[UILabel alloc]init];
        _authorPortrait=[[UIImageView alloc]init];
        _mainDisplayPic=[[UIImageView alloc]init];
        _theme=[[UILabel alloc]init];
        _addtionalContent=[[UILabel alloc]init];
        _latestTime=[[UILabel alloc]init];
        _viewMore=[[UIButton alloc]init];
        //
#pragma mark UI
        _mainDisplayPic.layer.cornerRadius=10;
        _mainDisplayPic.clipsToBounds=YES;
        //
        _authorPortrait.layer.cornerRadius=5;
        _authorPortrait.clipsToBounds=YES;
        //
        self.contentView.backgroundColor=UIColor.whiteColor;
    }
    [self.contentView addSubview:_k_baseOutLinView];
    _k_baseOutLinView.sd_layout
    .leftSpaceToView(self.contentView, 4*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.contentView, 4*HEIGHT_LzgDevicePixlesHandle)
    .rightSpaceToView(self.contentView, 4*WIDTH_LzgDevicePixlesHandle)
    .bottomSpaceToView(self.contentView, 4*HEIGHT_LzgDevicePixlesHandle);
    _k_baseOutLinView.layer.cornerRadius=4*WIDTH_LzgDevicePixlesHandle;
    _k_baseOutLinView.layer.shadowColor=UIColor.lightGrayColor.CGColor;
    _k_baseOutLinView.layer.shadowOpacity=0.2;
    _k_baseOutLinView.layer.shadowOffset=CGSizeMake(0, 0);
    _k_baseOutLinView.layer.shadowRadius=4*WIDTH_LzgDevicePixlesHandle;
    [_k_baseOutLinView sd_addSubviews:@[_mainDisplayPic,_authorName,_authorPortrait,_likeIt,_theme,_addtionalContent,_latestTime,_viewMore]];
    //
    
    //
    _authorName.sd_layout
    .leftSpaceToView(_k_baseOutLinView, 20*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(_k_baseOutLinView, 20*WIDTH_LzgDevicePixlesHandle)
    .widthIs(20*WIDTH_LzgDevicePixlesHandle)
    .heightEqualToWidth();
    
    return self;
}
@end
