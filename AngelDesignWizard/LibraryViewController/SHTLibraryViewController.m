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
@end

@implementation SHTLibraryViewController
-(instancetype)init
{
    if (self=[super init])
    {
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
        
#pragma mark UI测试
        
        
        _displayContent.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return self;
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
     cell.author.text=cellinfor[@"name"];
//     @property(nonatomic,readonly)UIButton *blockBtn;
//     @property(nonatomic,readonly)UIButton *reportBtn;
//     @property(nonatomic,readonly)UILabel *dateMonth;
    cell.dateMonth.text=cellinfor[@"date"];
//     @property(nonatomic,readonly)UILabel *dateDay;
    
    cell.dateDay.text=cellinfor[@"time"];
//     @property(nonatomic,readonly)UILabel *score;
    NSNumber *objNum=cellinfor[@"stars"];
    
    cell.score.text=[NSString stringWithFormat:@"%d",objNum.intValue];
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
//    NSLog(@"%@",_contentData);
}
#pragma mark SHTCellDelegate
-(void)SHTTableViewCellButtonActionDelegateViewFullAction:(UIButton *)sender
{
    NSLog(@"%s",sel_getName(_cmd));
}
-(void)SHTTableViewCellButtonActionDelegateBlockAction:(UIButton *)sender
{
    NSLog(@"%s",sel_getName(_cmd));
}
-(void)SHTTableViewCellButtonActionDelegateReportAction:(UIButton *)sender
{
    NSLog(@"%s",sel_getName(_cmd));
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
