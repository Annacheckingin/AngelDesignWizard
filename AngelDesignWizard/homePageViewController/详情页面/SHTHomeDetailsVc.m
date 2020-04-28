//
//  SHTHomeDetailsVc.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTHomeDetailsVc.h"
#import "SHTDetailDataSourceAndDelegate.h"
#import "SHTLabel.h"
@interface SHTHomeDetailsVc ()
@property(nonatomic,assign)BOOL isLike;
@property(nonatomic,strong)SHTDetailDataSourceAndDelegate* DADobject;
@end

//static inline void singleViewArrangeSubViews(UIView *baseView,NSArray *subViews)
//{
//
//}
@implementation SHTHomeDetailsVc
-(void)viewWillAppear:(BOOL)animated
{
    
    __weak typeof (self) weakself=self;
    if (self.contentMake)
    {
        self.contentMake(weakself.topimage, weakself.pagetitle, weakself.portrait, weakself.name, weakself.picLeftTopCorner, weakself.picLeftBlow, weakself.picRightTopCorner, weakself.picRightblow, weakself.briefContent);
    }
    
}
-(instancetype)init
{
    if (self=[super init])
    {
        /*
         @property(nonatomic,readonly)UILabel *pagetitle;
         @property(nonatomic,readonly)UIImageView *topimage;
         @property(nonatomic,readonly)UIImageView *portrait;
         @property(nonatomic,readonly)UIButton *likes;
         @property(nonatomic,readonly)UIButton *reportBtn;
         @property(nonatomic,readonly)UIButton *blockBtn;
         @property(nonatomic,readonly)UILabel *listPicsTitle;
         @property(nonatomic,readonly)UIImageView *picLeftTopCorner;
         @property(nonatomic,readonly)UIImageView *picRightTopCorner;
         @property(nonatomic,readonly)UIImageView *picLeftBlow;
         @property(nonatomic,readonly)UIImageView *picRightblow;
         @property(nonatomic,readonly)UILabel *introdutionLabel;
         @property(nonatomic,readonly)UILabel *briefContent;
         @property(nonatomic,strong)UITableView *comments;
         **/
        _DADobject=[[SHTDetailDataSourceAndDelegate alloc]init];
        _content=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//      _content.style
        _content.delegate=_DADobject;
        _content.dataSource=_DADobject;
        _topimage=[[UIImageView alloc]init];
        _topimage.userInteractionEnabled=YES;
        _name=[[UILabel alloc]init];
        _pagetitle=[[UILabel alloc]init];
        _pagetitle.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:18];
        _portrait=[[UIImageView alloc]init];
        _likes=[[UIButton alloc]init];
        [_likes setImage:[UIImage imageNamed:@"1_25"] forState:UIControlStateNormal];
        [_likes setImage:[UIImage imageNamed:@"1_23"] forState:UIControlStateSelected];
        _reportBtn=[[UIButton alloc]init];
        _blockBtn=[[UIButton alloc]init];
        _listPicsTitle=[[UILabel alloc]init];
        _listPicsTitle.text=@"Album Of Works";
        _listPicsTitle.font=[UIFont fontWithName:@"Courier-BoldOblique" size:11];
        _picLeftTopCorner=[[UIImageView alloc]init];
        _picRightTopCorner=[[UIImageView alloc]init];
        _picLeftBlow=[[UIImageView alloc]init];
        _picRightblow=[[UIImageView alloc]init];
        _introdutionLabel=[[UILabel alloc]init];
        _introdutionLabel.text=[@"introduction to works" capitalizedString] ;
        _briefContent=[[SHTLabel alloc]init];
        _briefContent.lineBreakMode=NSLineBreakByTruncatingTail;
        _briefContent.textColor=UIColor.lightGrayColor;
        _briefContent.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:11];
#pragma mark 事件绑定
        [_likes addTarget:self action:@selector(k_likeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_reportBtn setImage:[UIImage imageNamed:@"1_39"] forState:UIControlStateNormal];
        [_reportBtn addTarget:self action:@selector(k_ReportAction:) forControlEvents:UIControlEventTouchUpInside];
        [_blockBtn addTarget:self action:@selector(k_blockAction:) forControlEvents:UIControlEventTouchUpInside];
        [_blockBtn setImage:[UIImage imageNamed:@"1_42"] forState:UIControlStateNormal];
        _DADobject.blockBtn=self.blockBtn;
        _DADobject.reportBtn=self.reportBtn;
        _DADobject.topimage=self.topimage;
        _DADobject.pagetitle=self.pagetitle;
        _DADobject.likes=self.likes;
        _DADobject.name=self.name;
        _DADobject.portrait=self.portrait;
        _DADobject.listPicsTitle=self.listPicsTitle;
        _DADobject.picLeftBlow=self.picLeftBlow;
        _DADobject.picLeftTopCorner=self.picLeftTopCorner;
        _DADobject.picRightblow=self.picRightblow;
        _DADobject.picRightTopCorner=self.picRightTopCorner;
        _DADobject.introdutionLabel=self.introdutionLabel;
        _DADobject.briefContent=self.briefContent;
    }
    return self;
}
-(void)k_likeAction:(UIButton *)sender
{
    sender.selected=!sender.selected;
}
-(void)k_ReportAction:(UIButton *)sender
{
    
}
-(void)k_blockAction:(UIButton *)sender
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=UIColor.whiteColor;
    [self setUpUi];
    [self.view bringSubviewToFront:self.backButton];
    // Do any additional setup after loading the view.
}
-(void)setUpUi
{
    [self.view addSubview:_content];
    _content.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomEqualToView(self.view);
    //
//  [_topimage sd_addSubviews:@[_pagetitle,_portrait,_name,_likes]];
////    _likes.backgroundColor=UIColor.redColor;
//    //
//     _pagetitle.sd_layout
//    .centerXEqualToView(_topimage)
//    .topSpaceToView(_topimage, 20*HEIGHT_LzgDevicePixlesHandle+[UIApplication sharedApplication].statusBarFrame.size.height)
//    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
//    [_pagetitle setSingleLineAutoResizeWithMaxWidth:250];
//
//    //
//    _portrait.sd_layout
//    .bottomSpaceToView(_topimage, 10*HEIGHT_LzgDevicePixlesHandle)
//    .leftSpaceToView(_topimage, 10*WIDTH_LzgDevicePixlesHandle)
//    .heightIs(20)
//    .widthEqualToHeight();
//    //
//    _name.sd_layout
//    .leftSpaceToView(_portrait, 5)
//    .centerYEqualToView(_portrait)
//    .heightRatioToView(_portrait, 1);
//    [_name setSingleLineAutoResizeWithMaxWidth:150];
//    //
//    _likes.sd_layout
//    .centerYEqualToView(_portrait)
//    .heightIs(30)
//    .widthEqualToHeight()
//    .rightSpaceToView(_topimage, 10);
//    //
//
//    //
//   [self.view sd_addSubviews:@[_topimage,_reportBtn,_blockBtn,_listPicsTitle,_picRightblow,_picLeftBlow,_picRightTopCorner,_picLeftTopCorner,_introdutionLabel,_briefContent]];
//
//    //
//
//    _topimage.sd_layout
//    .topEqualToView(self.view)
//    .leftEqualToView(self.view)
//    .rightEqualToView(self.view)
//    .heightIs(300*HEIGHT_LzgDevicePixlesHandle);
//    //
//    _reportBtn.sd_layout
//    .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//    .topSpaceToView(_topimage, 10*HEIGHT_LzgDevicePixlesHandle)
//    .widthIs(100)
//    .heightIs(20);
//    //
//    _blockBtn.sd_layout
//    .leftSpaceToView(_reportBtn, 10)
//    .centerYEqualToView(_reportBtn)
//    .heightRatioToView(_reportBtn, 1)
//    .widthRatioToView(_reportBtn, 1);
//    //
//     _listPicsTitle.sd_layout
//    .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//    .topSpaceToView(_reportBtn, 10*HEIGHT_LzgDevicePixlesHandle)
//    .heightIs(20);
//    [_listPicsTitle setSingleLineAutoResizeWithMaxWidth:150];
//    //
//    _picLeftTopCorner.sd_layout
//    .leftSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//    .widthIs((SCREENWIDTH_SHT-30*WIDTH_LzgDevicePixlesHandle)/2)
//    .heightIs(80*HEIGHT_LzgDevicePixlesHandle)
//    .topSpaceToView(_listPicsTitle, 5*HEIGHT_LzgDevicePixlesHandle);
//    //
//    _picRightTopCorner.sd_layout
//    .rightSpaceToView(self.view, 10*WIDTH_LzgDevicePixlesHandle)
//    .topEqualToView(_picLeftTopCorner)
//    .widthRatioToView(_picLeftTopCorner, 1)
//    .heightRatioToView(_picLeftTopCorner, 1);
//    //
//    _picLeftBlow.sd_layout
//    .leftEqualToView(_picLeftTopCorner)
//    .topSpaceToView(_picLeftTopCorner, 5*HEIGHT_LzgDevicePixlesHandle)
//    .heightRatioToView(_picLeftTopCorner, 1)
//    .widthRatioToView(_picLeftTopCorner, 1);
//    //
//    _picRightblow.sd_layout
//    .rightEqualToView(_picRightTopCorner)
//    .topEqualToView(_picLeftBlow)
//    .widthRatioToView(_picLeftBlow, 1)
//    .heightRatioToView(_picLeftBlow, 1);
//    //
//    _introdutionLabel.sd_layout
//    .leftSpaceToView(self.view, 10)
//    .topSpaceToView(_picLeftBlow, 10)
//     .heightIs(15);
//    [_introdutionLabel setSingleLineAutoResizeWithMaxWidth:200];
//    //
//    /*
//     @property(nonatomic,readonly)UILabel *listPicsTitle;
//             @property(nonatomic,readonly)UIImageView *picLeftTopCorner;
//             @property(nonatomic,readonly)UIImageView *picRightTopCorner;
//             @property(nonatomic,readonly)UIImageView *picLeftBlow;
//             @property(nonatomic,readonly)UIImageView *picRightblow;
//             @property(nonatomic,readonly)UILabel *introdutionLabel;
//             @property(nonatomic,readonly)UILabel *briefContent;
//             @property(nonatomic,strong)UITableView *comments;
//     **/
//    _briefContent.sd_layout
//    .leftEqualToView(_introdutionLabel)
//    .topSpaceToView(_introdutionLabel, 5)
//    .widthIs(SCREENWIDTH_SHT-20)
//    .heightIs(50);
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
