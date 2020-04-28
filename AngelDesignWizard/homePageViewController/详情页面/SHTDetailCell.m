//
//  SHTDetailCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTDetailCell.h"
#import "SHTLabel.h"
#import "NSString+SHTHeight.h"
@implementation SHTDetailCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier insertT:(UILabel *)titile subPics_Lt_Lb_Rt_R_b:(NSArray *)picArray andLabel:(UILabel *)intro andBriefLabel:(UILabel *)breif
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIView *baseView=[[UIView alloc]init];
//        baseView.backgroundColor=UIColor.blueColor;
//        self.contentView.backgroundColor=UIColor.greenColor;
        UILabel *_listPicsTitle=titile;
        UIImageView *_picLeftTopCorner=picArray[0];
        UIImageView *_picLeftBlow=picArray[1];
        UIImageView *_picRightTopCorner=picArray[2];
        UIImageView *_picRightblow=picArray[3];
        //
        UILabel *_introdutionLabel=intro;
        UILabel *_briefContent=breif;
        [self.contentView sd_addSubviews:@[baseView]];
        
        //
        baseView.sd_layout
               .leftEqualToView(self.contentView)
               .rightEqualToView(self.contentView)
               .topEqualToView(self.contentView)
               .heightIs(150*HEIGHT_LzgDevicePixlesHandle);
        //
        [baseView sd_addSubviews:@[_listPicsTitle,_picLeftTopCorner,_picRightTopCorner,_picLeftBlow,_picRightblow,_introdutionLabel,_briefContent]];
       
        
        ;
//        baseView.backgroundColor=UIColor.orangeColor;
        //
        _listPicsTitle.sd_layout
           .leftSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
           .topSpaceToView(baseView, 10*HEIGHT_LzgDevicePixlesHandle)
           .heightIs(20);
           [_listPicsTitle setSingleLineAutoResizeWithMaxWidth:150];
//        _listPicsTitle.backgroundColor=UIColor.redColor;
           //
//           _picLeftTopCorner.sd_layout
//           .leftEqualToView(_listPicsTitle)
//           .widthIs((SCREENWIDTH_SHT-30*WIDTH_LzgDevicePixlesHandle)/2)
//           .heightIs(80*HEIGHT_LzgDevicePixlesHandle)
//           .topSpaceToView(_listPicsTitle, 5*HEIGHT_LzgDevicePixlesHandle);
//        NSLog(@"%f",WIDTH_LzgDevicePixlesHandle);
//        NSLog(@"%f",HEIGHT_LzgDevicePixlesHandle);
        _picLeftTopCorner.sd_layout
        .topSpaceToView(_listPicsTitle, 10*HEIGHT_LzgDevicePixlesHandle)
        .leftSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
        .heightIs(80*HEIGHT_LzgDevicePixlesHandle)
        .widthIs((SCREENWIDTH_SHT-30*WIDTH_LzgDevicePixlesHandle)/2);
        
        //
        _picRightTopCorner.sd_layout
        .rightSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
        .centerYEqualToView(_picLeftTopCorner)
        .widthRatioToView(_picLeftTopCorner, 1)
        .heightRatioToView(_picLeftTopCorner, 1);
        //
        
        _picLeftBlow.sd_layout
        .topSpaceToView(_picLeftTopCorner, 10)
        .heightRatioToView(_picLeftTopCorner, 1)
        .leftEqualToView(_picLeftTopCorner)
        .widthRatioToView(_picLeftTopCorner, 1);
        //
        _picRightblow.sd_layout
        .rightEqualToView(_picRightTopCorner)
        .topSpaceToView(_picRightTopCorner, 10)
        .heightRatioToView(_picRightTopCorner, 1)
        .widthRatioToView(_picRightTopCorner, 1);
        //
        _introdutionLabel.sd_layout
        .leftSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
        .topSpaceToView(_picLeftBlow, 10*HEIGHT_LzgDevicePixlesHandle)
        .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
        [_introdutionLabel setSingleLineAutoResizeWithMaxWidth:250];
        //
        
    __weak SHTLabel *label=(SHTLabel *)_briefContent;
        label.sd_layout
         .leftEqualToView(_introdutionLabel)
         .rightSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
         .topSpaceToView(_introdutionLabel, 1*HEIGHT_LzgDevicePixlesHandle)
         .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
        //
       
        
        label.heightHandle = ^(NSString * _Nonnull text)
        {
            if (text!=nil)
            {
                         label.sd_resetLayout
                       .leftEqualToView(_introdutionLabel)
                         .rightSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
                         .topSpaceToView(_introdutionLabel, 1*HEIGHT_LzgDevicePixlesHandle)
                         .heightIs([text sHTHeightInWidth:SCREENWIDTH_SHT-20*WIDTH_LzgDevicePixlesHandle]*HEIGHT_LzgDevicePixlesHandle);
            }
         
        };
    
//        _picLeftTopCorner.backgroundColor=UIColor.blueColor;
//        _picLeftTopCorner.layer.cornerRadius=50;
//        _picLeftTopCorner.clipsToBounds=YES;
//        _picLeftTopCorner.alpha=0.5;
           //
//           _picRightTopCorner.sd_layout
//           .rightSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
//           .topEqualToView(_picLeftTopCorner)
//           .widthRatioToView(_picLeftTopCorner, 1)
//           .heightRatioToView(_picLeftTopCorner, 1);
           //
//           _picLeftBlow.sd_layout
//           .leftEqualToView(_picLeftTopCorner)
//           .topSpaceToView(_picLeftTopCorner, 5*HEIGHT_LzgDevicePixlesHandle)
//           .heightRatioToView(_picLeftTopCorner, 1)
//           .widthRatioToView(_picLeftTopCorner, 1);
//           //
//
//
//        //
//
//        _picRightTopCorner.sd_layout
//        .leftSpaceToView(_picLeftTopCorner, 10*WIDTH_LzgDevicePixlesHandle)
//        .widthRatioToView(_picLeftTopCorner, 1)
//        .heightRatioToView(_picLeftTopCorner, 1)
//        .topEqualToView(_picLeftTopCorner)
//        ;
//           _picRightblow.sd_layout
//           .rightEqualToView(_picRightTopCorner)
//           .topEqualToView(_picLeftBlow)
//           .widthRatioToView(_picLeftBlow, 1)
//           .heightRatioToView(_picLeftBlow, 1);
//           //
//           _introdutionLabel.sd_layout
//           .leftSpaceToView(baseView, 10)
//           .topSpaceToView(_picLeftBlow, 10)
//            .heightIs(15);
//           [_introdutionLabel setSingleLineAutoResizeWithMaxWidth:200];
//           //
//           /*
//            @property(nonatomic,readonly)UILabel *listPicsTitle;
//                    @property(nonatomic,readonly)UIImageView *picLeftTopCorner;
//                    @property(nonatomic,readonly)UIImageView *picRightTopCorner;
//                    @property(nonatomic,readonly)UIImageView *picLeftBlow;
//                    @property(nonatomic,readonly)UIImageView *picRightblow;
//                    @property(nonatomic,readonly)UILabel *introdutionLabel;
//                    @property(nonatomic,readonly)UILabel *briefContent;
//                    @property(nonatomic,strong)UITableView *comments;
//            **/
//           _briefContent.sd_layout
//           .leftEqualToView(_introdutionLabel)
//           .topSpaceToView(_introdutionLabel, 5)
//           .widthIs(SCREENWIDTH_SHT-20)
//           .heightIs(50);
//        self.backgroundColor=UIColor.purpleColor;
        
        
        [self setupAutoHeightWithBottomView:baseView bottomMargin:10];
       
//        [self.contentView sd_addSubviews:@[_topimage,_reportBtn,_blockBtn,_listPicsTitle,_picRightblow,_picLeftBlow,_picRightTopCorner,_picLeftTopCorner,_introdutionLabel,_briefContent]];
//
//        //
//
//        _topimage.sd_layout
//        .topEqualToView(self.view)
//        .leftEqualToView(self.view)
//        .rightEqualToView(self.view)
//        .heightIs(300*HEIGHT_LzgDevicePixlesHandle);
//        //
//        _reportBtn.sd_layout
//        .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//        .topSpaceToView(_topimage, 10*HEIGHT_LzgDevicePixlesHandle)
//        .widthIs(100)
//        .heightIs(20);
//        //
//        _blockBtn.sd_layout
//        .leftSpaceToView(_reportBtn, 10)
//        .centerYEqualToView(_reportBtn)
//        .heightRatioToView(_reportBtn, 1)
//        .widthRatioToView(_reportBtn, 1);
//        //
//         _listPicsTitle.sd_layout
//        .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//        .topSpaceToView(_reportBtn, 10*HEIGHT_LzgDevicePixlesHandle)
//        .heightIs(20);
//        [_listPicsTitle setSingleLineAutoResizeWithMaxWidth:150];
//        //
//        _picLeftTopCorner.sd_layout
//        .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//        .widthIs((SCREENWIDTH_SHT-30*WIDTH_LzgDevicePixlesHandle)/2)
//        .heightIs(80*HEIGHT_LzgDevicePixlesHandle)
//        .topSpaceToView(_listPicsTitle, 5*HEIGHT_LzgDevicePixlesHandle);
//        //
//        _picRightTopCorner.sd_layout
//        .rightSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//        .topEqualToView(_picLeftTopCorner)
//        .widthRatioToView(_picLeftTopCorner, 1)
//        .heightRatioToView(_picLeftTopCorner, 1);
//        //
//        _picLeftBlow.sd_layout
//        .leftEqualToView(_picLeftTopCorner)
//        .topSpaceToView(_picLeftTopCorner, 5*HEIGHT_LzgDevicePixlesHandle)
//        .heightRatioToView(_picLeftTopCorner, 1)
//        .widthRatioToView(_picLeftTopCorner, 1);
//        //
//        _picRightblow.sd_layout
//        .rightEqualToView(_picRightTopCorner)
//        .topEqualToView(_picLeftBlow)
//        .widthRatioToView(_picLeftBlow, 1)
//        .heightRatioToView(_picLeftBlow, 1);
//        //
//        _introdutionLabel.sd_layout
//        .leftSpaceToView(self.view, 10)
//        .topSpaceToView(_picLeftBlow, 10)
//         .heightIs(15);
//        [_introdutionLabel setSingleLineAutoResizeWithMaxWidth:200];
//        //
//        /*
//         @property(nonatomic,readonly)UILabel *listPicsTitle;
//                 @property(nonatomic,readonly)UIImageView *picLeftTopCorner;
//                 @property(nonatomic,readonly)UIImageView *picRightTopCorner;
//                 @property(nonatomic,readonly)UIImageView *picLeftBlow;
//                 @property(nonatomic,readonly)UIImageView *picRightblow;
//                 @property(nonatomic,readonly)UILabel *introdutionLabel;
//                 @property(nonatomic,readonly)UILabel *briefContent;
//                 @property(nonatomic,strong)UITableView *comments;
//         **/
//        _briefContent.sd_layout
//        .leftEqualToView(_introdutionLabel)
//        .topSpaceToView(_introdutionLabel, 5)
//        .widthIs(SCREENWIDTH_SHT-20)
//        .heightIs(50);
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
