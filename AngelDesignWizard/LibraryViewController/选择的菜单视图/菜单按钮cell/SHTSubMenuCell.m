//
//  SHTSubMenuCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/24.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTSubMenuCell.h"

@implementation SHTSubMenuCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _content=[[UILabel alloc]init];
        _preTrangle=[[UIImageView alloc]init];
        _tailTrangle=[[UIImageView alloc]init];
        _preTrangle.contentMode=_tailTrangle.contentMode=UIViewContentModeScaleAspectFit;
    }
    [self.contentView sd_addSubviews:@[_preTrangle,_content,_tailTrangle]];
    
    
    
    _preTrangle.sd_layout
    .leftSpaceToView(self.contentView, 60*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(self.contentView)
    .widthIs(30)
    .heightEqualToWidth();
    //
    _tailTrangle.sd_layout
    .rightSpaceToView(self.contentView, 60*WIDTH_LzgDevicePixlesHandle)
    .heightIs(30)
    .widthEqualToHeight()
    .centerYEqualToView(self.contentView);
    _content.sd_layout
    .centerYEqualToView(_preTrangle)
    .centerXEqualToView(self.contentView)
    .heightIs(30);
    [_content setSingleLineAutoResizeWithMaxWidth:150];
    [self setupAutoHeightWithBottomViewsArray:@[self.contentView] bottomMargin:0];
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    if (selected==YES)
    {
        self.preTrangle.image=[UIImage imageNamed:@"traleft"];
        self.tailTrangle.image=[UIImage imageNamed:@"traright"];
    }
    else
    {
        self.preTrangle.image=nil;
        self.tailTrangle.image=nil;
    }
    
    // Configure the view for the selected state
}

@end
