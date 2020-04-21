//
//  SHTMenuCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/21.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTMenuCell.h"
@interface SHTMenuCell ()
@property(nonatomic,strong)UILabel *cellInfor;
@property(nonatomic,strong)UIImageView *cellIndicator;
@end
@implementation SHTMenuCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _cellInfor=[[UILabel alloc]init];
        _cellInfor.textColor=UIColor.grayColor;
        _cellIndicator=[[UIImageView alloc]init];
        _cellIndicator.contentMode=UIViewContentModeScaleAspectFit;
    }
    [self.contentView sd_addSubviews:@[_cellInfor,_cellIndicator]];
    
    _cellInfor.sd_layout
    .leftSpaceToView(self.contentView, 50*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(self.contentView)
    .heightIs(50*HEIGHT_LzgDevicePixlesHandle);
   //
    [_cellInfor setSingleLineAutoResizeWithMaxWidth:150];
    _cellInfor.font=[UIFont fontWithName:@"CourierNewPSMT" size:15];
    _cellIndicator.sd_layout
    .rightSpaceToView(self.contentView, 30*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(self.contentView)
    .heightIs(30)
    .widthEqualToHeight();
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    [self setupAutoHeightWithBottomView:_cellInfor bottomMargin:0];
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
