//
//  SHTTableViewCell.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/21.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTTableViewCell.h"
#import "SHTLabel.h"
#define SHTRoutingMask 01
#define SHTRoutingYES 017
#define SHTRoutingNO 00
typedef struct SHTTableViewCellSelectorRouting
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
    //
    [self setupAutoHeightWithBottomView:_viewFullSize bottomMargin:10];
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


-(void)setDelegate:(id<SHTTableViewCellButtonActionDelegate>)delegate
{
    _delegate=delegate;
    
    
    if ((self.actionRouting.routingForProtocol&SHTRoutingMask))
    {
        NSLog(@"didn't");
        if (self.actionRouting.routingForblock&SHTRoutingMask<<2)
        {
            [_blockBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateBlockAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (self.actionRouting.routingforReport&SHTRoutingMask<<3)
        {
            [_reportBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateReportAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (self.actionRouting.routingForViewFull&SHTRoutingMask<<1) {
            [_viewFullSize addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        return;
    }
     //
    
    if([_delegate conformsToProtocol:@protocol(SHTTableViewCellButtonActionDelegate)])
    {
        SHTTableViewCellSelectorRouting *add=&(_actionRouting);
        (*add).routingForProtocol=SHTRoutingMask;
        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateBlockAction:)])
        {
            [_blockBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateBlockAction:) forControlEvents:UIControlEventTouchUpInside];
            add->routingForblock=(SHTRoutingMask<<2);
        }
        
        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateReportAction:)])
        {
            [_reportBtn addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateReportAction:) forControlEvents:UIControlEventTouchUpInside];
            add->routingforReport=(SHTRoutingMask<<3);
        }
        
        if ([_delegate respondsToSelector:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:)])
        {
            [_viewFullSize addTarget:_delegate action:@selector(SHTTableViewCellButtonActionDelegateViewFullAction:) forControlEvents:UIControlEventTouchUpInside];
            add->routingForViewFull=(SHTRoutingMask<<1);
        }
    }
    [self setDelegate:_delegate];
    
}
@end
