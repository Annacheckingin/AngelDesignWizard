//
//  SHTTableViewCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/21.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTTableViewCell.h"
#import "SHTLabel.h"
#include <stdlib.h>
#define SHTRoutingMask 01
#define SHTRoutingYES 017
#define SHTRoutingNO 00
typedef struct
{
    int8_t routingforReport:1;
    int8_t routingForblock:1;
    int8_t routingForViewFull:1;
    int8_t routingForProtocol:1;
}SHTTableViewCellSelectorRouting;

@interface SHTTableViewCell ()
@property(nonatomic,strong)UIImageView *glancePic;
@property(nonatomic,strong)UIButton *viewFullSize;
@property(nonatomic,strong)SHTLabel *sloganText;
@property(nonatomic,strong)UILabel *author;
@property(nonatomic,strong)UIButton *blockBtn;
@property(nonatomic,strong)UIButton *reportBtn;
@property(nonatomic,strong)UILabel *dateMonth;
@property(nonatomic,strong)UILabel *dateDay;
@property(nonatomic,strong)UILabel *score;
@property(nonatomic,assign)SHTTableViewCellSelectorRouting actionRouting;
@end
@implementation SHTTableViewCell
-(void)k_configUi
{
    _glancePic.layer.cornerRadius=5;
    _glancePic.clipsToBounds=YES;
    [_viewFullSize setImage:[UIImage imageNamed:@"1_35"] forState:UIControlStateNormal];
    
    _sloganText.font=[UIFont fontWithName:@"AmericanTypewriter" size:11];
    _sloganText.numberOfLines=0;
    _sloganText.lineBreakMode=NSLineBreakByTruncatingTail;
    _score.font=[UIFont fontWithName:@"AmericanTypewriter" size:11];
    _author.textColor=UIColor.lightGrayColor;
    _dateMonth.textColor=UIColor.grayColor;
    _dateDay.textColor=UIColor.lightGrayColor;
    _dateMonth.font=[UIFont fontWithName:@"Courier-BoldOblique" size:12];
    _dateDay.font=[UIFont fontWithName:@"Courier" size:9];
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        _glancePic=[[UIImageView alloc]init];
        _viewFullSize=[[UIButton alloc]init];
        _viewFullSize.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _sloganText=[[SHTLabel alloc]init];
        _author=[[UILabel alloc]init];
        _blockBtn=[[UIButton alloc]init];
        [_blockBtn setImage:[UIImage imageNamed:@"1_100"] forState:UIControlStateNormal];
        _reportBtn=[[UIButton alloc]init];
        [_reportBtn setImage:[UIImage imageNamed:@"1_98"] forState:UIControlStateNormal];
        _reportBtn.imageView.contentMode=_blockBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _dateMonth=[[UILabel alloc]init];
        _dateDay=[[UILabel alloc]init];
        _score=[UILabel new];
        _author.font=[UIFont fontWithName:@"AppleGothic" size:11];
    }
    [self k_configUi];
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
    .heightIs(10*HEIGHT_LzgDevicePixlesHandle);
    
    __weak typeof (self) weakSelf=self;
    _sloganText.heightHandle = ^(NSString * _Nonnull text)
    {
       NSString *theString=[text copy];
       CGSize theContentSize=[theString boundingRectWithSize:CGSizeMake(SCREENWIDTH_SHT-95*WIDTH_LzgDevicePixlesHandle,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
        if (theContentSize.height>30)
        {
            theContentSize.height=30;
        }
        weakSelf.sloganText.sd_resetLayout
        .leftSpaceToView(weakSelf.glancePic, 5)
        .topEqualToView(weakSelf.glancePic)
        .rightSpaceToView(weakSelf.contentView, 20*WIDTH_LzgDevicePixlesHandle)
        .heightIs(theContentSize.height);
    };
    //
    //
    _author.sd_layout
    .leftSpaceToView(_glancePic, 5)
    .topSpaceToView(_sloganText, 5)
    .heightIs(20);
    [_author setSingleLineAutoResizeWithMaxWidth:100];
    //
    _blockBtn.sd_layout
    .rightEqualToView(_sloganText)
    .topSpaceToView(_sloganText, 5)
    .heightIs(20)
    .widthEqualToHeight();
    //
    _reportBtn.sd_layout
    .rightSpaceToView(_blockBtn, 5)
    .widthRatioToView(_blockBtn, 1)
    .topEqualToView(_blockBtn)
    .heightEqualToWidth();
    //
    _score.sd_layout
    .rightEqualToView(_blockBtn)
    .topSpaceToView(_blockBtn, 5)
    .widthIs(20)
    .heightIs(20)
    ;
    //
    _dateMonth.sd_layout.leftSpaceToView(_glancePic, 2*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(_score)
    .heightIs(15*HEIGHT_LzgDevicePixlesHandle);
    [_dateMonth setSingleLineAutoResizeWithMaxWidth:150];
    //
    _dateDay.sd_layout
    .leftSpaceToView(_dateMonth, 10)
    .heightRatioToView(_dateMonth, 1)
    .centerYEqualToView(_dateMonth);
    [_dateDay setSingleLineAutoResizeWithMaxWidth:100];
    //
    //
    [self setupAutoHeightWithBottomView:_viewFullSize bottomMargin:10];
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UIImageView *)imageViewHeart{
    UIImageView *heart=[[UIImageView alloc]init];
    heart.image=[UIImage imageNamed:@"1_23"];
    heart.contentMode=UIViewContentModeScaleAspectFit;
    return heart;
}
-(void)setLikeCount:(NSInteger)count
{
    NSMutableArray *heartArray=[NSMutableArray array];
    
    
    for (int k=0; k<count; k++)
    {
        [heartArray addObject:[self imageViewHeart]];
    }
    
    UIView *refenfence=self.score;
    for (UIView *obj in heartArray)
    {
        [self.contentView addSubview:obj];
        obj.sd_layout
        .rightSpaceToView(refenfence, 5)
        .centerYEqualToView(refenfence)
        .heightRatioToView(refenfence, 1)
        .widthIs(15);
        refenfence=obj;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    NSLog(@"incoming");
    // Configure the view for the selected state
}


-(void)setDelegate:(id<SHTTableViewCellButtonActionDelegate>)delegate
{
    _delegate=delegate;
    int8_t *add=&(_actionRouting);
    if ((*add)&SHTRoutingMask)
    {
        if ((*add)&SHTRoutingMask<<2)
        {
           
            [_blockBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateBlockAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if ((*add)&SHTRoutingMask<<3)
        {
            
            [_reportBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateReportAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if ((*add)&SHTRoutingMask<<1)
        {
           
            [_viewFullSize addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        return;
    }
     //
    
    if([_delegate conformsToProtocol:@protocol(SHTTableViewCellButtonActionDelegate)])
    {
        int8_t *add=&(_actionRouting);
        *add=(*add)|SHTRoutingMask;

        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:)])
               {
                   [_viewFullSize addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:) forControlEvents:UIControlEventTouchUpInside];
                   *add=(*add)|(SHTRoutingMask<<1);
               }
        
        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateBlockAction:)])
        {
            [_blockBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateBlockAction:) forControlEvents:UIControlEventTouchUpInside];
            *add=(*add)|(SHTRoutingMask<<2);
        }
        
        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateReportAction:)])
        {
            [_reportBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateReportAction:) forControlEvents:UIControlEventTouchUpInside];
            *add=(*add)|(SHTRoutingMask<<3);
        }
    }
    [self setDelegate:_delegate];
    
}
@end
