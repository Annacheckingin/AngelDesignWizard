//
//  SHTLibraryViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTLibraryViewController.h"
#import "SHTPlistDataHandle.h"
#import "SHTTableViewCell.h"
#import "SHTLabel.h"
#import "SHTMenuEventHandle.h"
#import "UIButton+SHTViewPresentLogic.h"
#import "Button_LogcMacro.h"
@interface SHTLibraryViewController ()<UITableViewDelegate,UITableViewDataSource,SHTTableViewCellButtonActionDelegate>
{
    BOOL needFresh;
}
@property(nonatomic,strong,readwrite)UILabel *currenCategory;
@property(nonatomic,strong,readwrite)UIButton *choseCategory;
@property(nonatomic,strong,readwrite)UITableView *displayContent;
@property(nonatomic,strong)NSMutableDictionary *contentData;
@property(nonatomic,weak)NSMutableArray *cateGoryF;
@property(nonatomic,weak)NSMutableArray *cateGoryS;
@property(nonatomic,weak)NSMutableArray *cateGoryT;
@property(nonatomic,weak)NSMutableArray *curentData;
@property(nonatomic,strong)SHTMenuEventHandle *subMenuEventHandle;
@end

@implementation SHTLibraryViewController
-(instancetype)init
{
    if (self=[super init])
    {
        _subMenuEventHandle=[[SHTMenuEventHandle alloc]init];
        _subMenuEventHandle.viewControllerContext=self;
        _currenCategory=[[UILabel alloc]init];
        _currenCategory.text=@"Home furnishing villa";
        _currenCategory.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:15];
        _choseCategory=[[UIButton alloc]init];
        _choseCategory.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_choseCategory setImage:[UIImage imageNamed:@"1_83"] forState:UIControlStateNormal];
        _displayContent=[[UITableView alloc]init];
        _displayContent.delegate=self;
        _displayContent.dataSource=self;
        self->needFresh=YES;
#pragma mark 事件绑定
        [_choseCategory addTarget:self action:@selector(k_changeCategoryMenu:) forControlEvents:UIControlEventTouchUpInside];
        _choseCategory.isShown=ButtonSHTViewPresentLogicMakeWithBOOL(NO);
#pragma mark UI测试
        
        
        _displayContent.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return self;
}
#pragma  mark 弹出选择小弹窗
-(void)k_changeCategoryMenu:(UIButton *)sender
{
    static UITableView *menu=nil;
    ButtonSHTViewPresentLogic v=sender.isShown;
  static UIView *coberViewPoint;
    typeof (self) weakSelf=self;
    int8_t *bv=&v;
    //下方判断是否已经弹出了选择视图,如果没有弹出视图，则弹出视图
    if (!((*bv)&ButtonSHTViewPresentLogicMask))
    {
      
          UITableView *subMenu=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, SCREENWIDTH_SHT, 1)];
//        subMenu.layer.cornerRadius=20;
//        subMenu.clipsToBounds=YES;
        subMenu.separatorStyle=UITableViewCellSelectionStyleNone;
        subMenu.dataSource=_subMenuEventHandle;
        subMenu.delegate=_subMenuEventHandle;
          menu=subMenu;
          UIImage *backimage=[UIImage imageNamed:@"1_129.png"];
          subMenu.backgroundView.layer.contents=(__bridge id _Nullable)(backimage.CGImage);
//        subMenu.backgroundColor=UIColor.clearColor;
//        subMenu.backgroundColor=[UIColor colorWithPatternImage:backimage];
        //  subMenu.delegate=_subMenuEventHandle;
        //  subMenu.dataSource=_subMenuEventHandle;
          [UIView transitionWithView:subMenu duration:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^
          {
              [self.view addSubview:subMenu];
              subMenu.sd_layout
              .topSpaceToView(sender, 1)
              .widthIs(SCREENWIDTH_SHT)
              .heightIs(300);
          } completion:^(BOOL finished)
          {
              ButtonSHTViewPresentLogic x=ButtonSHTViewPresentLogicMakeWithBOOL(YES);
              sender.isShown=x;
             weakSelf.displayContent.userInteractionEnabled=NO;
              UIView *coverView=[[UIView alloc]init];
              coverView.backgroundColor=UIColor.lightGrayColor;
//              coverView.frame=[UIScreen mainScreen].bounds;
              coverView.alpha=0.5;
              [self.view insertSubview:coverView belowSubview:menu];
              coberViewPoint=coverView;
              coverView.sd_layout
              .topEqualToView(menu)
              .leftEqualToView(self.view)
              .rightEqualToView(self.view)
              .bottomEqualToView(self.view);
              coberViewPoint=coverView;
          }];
       
    }
    else
    {
        menu.dataSource=nil;
        menu.delegate=nil;
        [menu removeFromSuperview];
        [coberViewPoint removeFromSuperview];
        sender.isShown=ButtonSHTViewPresentLogicMakeWithBOOL(NO);
        weakSelf.displayContent.userInteractionEnabled=YES;
    }
    
}
#pragma mark tablviewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark tableviewDatasorce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _curentData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH_SHT tableView:tableView];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view=[UIView new];
    view.backgroundColor=UIColor.lightGrayColor;
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHTTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTTableViewCell class])];
    if (cell==nil)
    {
        cell=[[SHTTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTTableViewCell class])];
    }
    UIImage *placeholderimg=[UIImage imageNamed:@"placeholder.png"];
    NSDictionary *cellinfor=_curentData[indexPath.section];
//     @property(nonatomic,readonly)UIImageView *glancePic;
    if ([_curentData[indexPath.row][@"imgMain"] isKindOfClass:[NSString class]])
    {
         [cell.glancePic yy_setImageWithURL:cellinfor[@"imgMain"] placeholder: placeholderimg];
    }
    else if([_curentData[indexPath.row][@"imgMain"] isKindOfClass:[UIImage class]])
          {
              [cell.glancePic setImage:cellinfor[@"imgMain"]];
          }

//     @property(nonatomic,readonly)UITextView *sloganText;
    cell.sloganText.text=cellinfor[@"introduce"];
    
//     @property(nonatomic,readonly)UILabel *author;
    cell.author.text=[NSString stringWithFormat:@"Designer:%@",cellinfor[@"name"]];;
//     @property(nonatomic,readonly)UIButton *blockBtn;
//     @property(nonatomic,readonly)UIButton *reportBtn;
//     @property(nonatomic,readonly)UILabel *dateMonth;
    cell.dateMonth.text=cellinfor[@"date"];
//     @property(nonatomic,readonly)UILabel *dateDay;
    
    cell.dateDay.text=cellinfor[@"time"];
//     @property(nonatomic,readonly)UILabel *score;
    NSNumber *objNum=cellinfor[@"stars"];
    
    cell.score.text=[NSString stringWithFormat:@"%d",objNum.intValue];
    [cell setLikeCount:objNum.integerValue];
   //

    cell.delegate=self;
    return cell;
    
}
#pragma mark 分割线/////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_currenCategory,_choseCategory,_displayContent]];
//    self.view SHT_a
    [self setUpUi];
    [self uiTest];
    // Do any additional setup after loading the view.
}
-(void)uiTest
{
    
}
-(void)setUpUi
{
    _currenCategory.sd_layout
    .topSpaceToView(self.view, 50*HEIGHT_LzgDevicePixlesHandle)
    .centerXEqualToView(self.view)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_currenCategory setSingleLineAutoResizeWithMaxWidth:200];
    //
    //
    _choseCategory.sd_layout
    .leftSpaceToView(_currenCategory, 5)
    .centerYEqualToView(_currenCategory)
    .widthIs(20)
    .heightEqualToWidth();
    //
    _displayContent.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .topSpaceToView(_currenCategory, 10*HEIGHT_LzgDevicePixlesHandle);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self->needFresh)
    {
        [self k_freshData];
    }
}
-(void)k_freshData
{
    [self k_actualFresh];
    self->needFresh=NO;
}
-(void)k_actualFresh
{
    
    SHTPlistDataHandle *piltHandle=[SHTPlistDataHandle shareInstance];
    self.contentData=[[NSMutableDictionary alloc]initWithDictionary:[piltHandle fetchDataWithKey:@"Library"]];
    _cateGoryF=self.contentData[@"HotelSpace"];
    _cateGoryS=self.contentData[@"FamousCompany"];
    _cateGoryT=self.contentData[@"SoftWork"];
    _curentData=_cateGoryF;
    //
}
#pragma mark SHTCellDelegate
-(void)SHTTableViewCellButtonActionDelegateViewFullAction:(UIButton *)sender
{
    
}
-(void)SHTTableViewCellButtonActionDelegateBlockAction:(UIButton *)sender
{
  
}
-(void)SHTTableViewCellButtonActionDelegateReportAction:(UIButton *)sender
{
    
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
