//
//  SHTTableViewCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/21.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTTableViewCell.h"
@interface SHTTableViewCell ()
@property(nonatomic,strong)UIImageView *glancePic;
@property(nonatomic,strong)UIButton *viewFullSize;
@property(nonatomic,strong)UITextView *sloganText;
@property(nonatomic,strong)UILabel *author;
@property(nonatomic,strong)UIButton *blockBtn;
@property(nonatomic,strong)UIButton *reportBtn;
@property(nonatomic,strong)UILabel *dateMonth;
@property(nonatomic,strong)UILabel *dateDay;
@property(nonatomic,strong)UILabel *score;
@end
@implementation SHTTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _glancePic=[[UIImageView alloc]init];
        _viewFullSize=[[UIButton alloc]init];
        _viewFullSize.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _sloganText=[[UITextView alloc]init];
        _sloganText.userInteractionEnabled=NO;
        _author=[[UILabel alloc]init];
        _blockBtn=[[UIButton alloc]init];
        _reportBtn=[[UIButton alloc]init];
        _dateMonth=[[UILabel alloc]init];
        _dateDay=[[UILabel alloc]init];
        _score=[UILabel new];
    }
    [self.contentView sd_addSubviews:@[_glancePic,_viewFullSize,_sloganText,_author,_blockBtn,_reportBtn,_dateMonth,_dateDay,_score]];
    
    _glancePic.sd_layout
    .leftSpaceToView(self.contentView, 15*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(self.contentView, 15*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(70*WIDTH_LzgDevicePixlesHandle)
    .heightEqualToWidth();
    //
    _viewFullSize.sd_layout
    .leftEqualToView(_glancePic)
    .topSpaceToView(_glancePic, 5)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(100*WIDTH_LzgDevicePixlesHandle)
    ;
    //
    _sloganText.sd_layout
    .leftSpaceToView(_glancePic, 5)
    .topEqualToView(_glancePic)
    .rightSpaceToView(self.contentView, 20*WIDTH_LzgDevicePixlesHandle)
    .heightIs(35*HEIGHT_LzgDevicePixlesHandle);
    //
    
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setLikeCount:(NSInteger)count
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
