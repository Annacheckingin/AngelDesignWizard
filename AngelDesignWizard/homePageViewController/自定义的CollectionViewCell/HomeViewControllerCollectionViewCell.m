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
        _mainDisplayPic.userInteractionEnabled=YES;
        _theme=[[UILabel alloc]init];
        _addtionalContent=[[UILabel alloc]init];
        _latestTime=[[UILabel alloc]init];
        _viewMore=[[UIButton alloc]init];
        _viewMore.contentMode=UIViewContentModeScaleAspectFit;
        [_viewMore setImage:[UIImage imageNamed:@"1_35"] forState:UIControlStateNormal];
        //
#pragma mark UI
        _mainDisplayPic.layer.cornerRadius=10;
        _mainDisplayPic.clipsToBounds=YES;
        //
        _authorPortrait.layer.cornerRadius=10;
        _authorPortrait.clipsToBounds=YES;
        //
        _theme.font=[UIFont fontWithName:@"AmericanTypewriter-Bold" size:17];
        _theme.lineBreakMode=NSLineBreakByTruncatingTail;
        //
        _addtionalContent.font=_theme.font;
        _addtionalContent.lineBreakMode=NSLineBreakByTruncatingTail;
        _authorName.font=[UIFont fontWithName:@"AmericanTypewriter" size:11];
        self.contentView.backgroundColor=UIColor.whiteColor;
    }
    [self.contentView sd_addSubviews:@[_k_baseOutLinView,_authorName,_authorPortrait,_theme,_addtionalContent,_latestTime,_viewMore]];
    _k_baseOutLinView.sd_layout
    .leftSpaceToView(self.contentView, 0*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.contentView, 0*HEIGHT_LzgDevicePixlesHandle)
    .rightSpaceToView(self.contentView, 0*WIDTH_LzgDevicePixlesHandle)
    .bottomSpaceToView(self.contentView, 0*HEIGHT_LzgDevicePixlesHandle);
    _k_baseOutLinView.layer.cornerRadius=4*WIDTH_LzgDevicePixlesHandle;
    _k_baseOutLinView.layer.shadowColor=UIColor.lightGrayColor.CGColor;
    _k_baseOutLinView.layer.shadowOpacity=0.2;
    _k_baseOutLinView.layer.shadowOffset=CGSizeMake(0, 0);
    _k_baseOutLinView.layer.shadowRadius=4*WIDTH_LzgDevicePixlesHandle;
    [_k_baseOutLinView sd_addSubviews:@[_mainDisplayPic,_likeIt]];
    //
    
    //
//    _authorName.sd_layout
//    .leftSpaceToView(_k_baseOutLinView, 20*WIDTH_LzgDevicePixlesHandle)
//    .topSpaceToView(_k_baseOutLinView, 20*WIDTH_LzgDevicePixlesHandle)
//    .widthIs(20*WIDTH_LzgDevicePixlesHandle)
//    .heightEqualToWidth();
    //
    _mainDisplayPic.sd_layout
    .leftEqualToView(_k_baseOutLinView)
    .topSpaceToView(_k_baseOutLinView, 0*HEIGHT_LzgDevicePixlesHandle)
    .rightEqualToView(_k_baseOutLinView)
    .bottomSpaceToView(_k_baseOutLinView, 40*HEIGHT_LzgDevicePixlesHandle);
    //
    _mainDisplayPic.contentMode=UIViewContentModeScaleAspectFill;
    //
    _viewMore.sd_layout
    .leftSpaceToView(self.contentView, 5*WIDTH_LzgDevicePixlesHandle)
    .bottomSpaceToView(self.contentView, 15*HEIGHT_LzgDevicePixlesHandle)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(100*WIDTH_LzgDevicePixlesHandle);
    //
    ;
    //
    _authorPortrait.sd_layout.leftSpaceToView(self.contentView, 10*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.contentView, 10*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(20*WIDTH_LzgDevicePixlesHandle)
    .heightEqualToWidth();
    _authorPortrait.backgroundColor=UIColor.blueColor;
    //
    _authorName.sd_layout.leftSpaceToView(_authorPortrait, 1)
    .centerYEqualToView(_authorPortrait)
    .heightRatioToView(_authorPortrait, 1);
    [_authorName setSingleLineAutoResizeWithMaxWidth:100];
    //
    /*
     @property(nonatomic,strong)UILabel *authorName;
     @property(nonatomic,strong)UIImageView *authorPortrait;
     @property(nonatomic,strong)UIImageView *mainDisplayPic;
     @property(nonatomic,strong)UILabel *theme;
     @property(nonatomic,strong)UILabel *addtionalContent;
     @property(nonatomic,strong)UILabel *latestTime;
     @property(nonatomic,strong)UIButton *viewMore;
     @property(nonatomic,strong)UIButton *likeIt;
     @property(nonatomic,strong)UIView *k_baseOutLinView;
     **/
    
    _theme.sd_layout
    .leftSpaceToView(_viewMore, 5*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(_viewMore)
    .heightRatioToView(_viewMore, 1);
    [_theme setSingleLineAutoResizeWithMaxWidth:250];
    //
//    _addtionalContent.sd_layout
//    .leftSpaceToView(_theme, 10*WIDTH_LzgDevicePixlesHandle)
//    .centerYEqualToView(_theme)
//    .heightRatioToView(_theme, 1)
//    .widthIs(150);
    return self;
}
@end
