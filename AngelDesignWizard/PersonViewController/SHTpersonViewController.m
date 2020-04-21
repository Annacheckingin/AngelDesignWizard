//
//  SHTpersonViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTpersonViewController.h"
#import "SHTMenuCell.h"
@interface SHTpersonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIImageView *k_portrait;
@property(nonatomic,strong)UILabel *k_name;
@property(nonatomic,strong)UILabel *k_infor;
@property(nonatomic,strong)UIButton *k_message;
@property(nonatomic,strong)UIButton *k_direction;
@property(nonatomic,strong)UILabel *k_followingLabel;
@property(nonatomic,strong)UILabel *k_followersLabel;
@property(nonatomic,strong)UILabel *k_likesLabel;
@property(nonatomic,strong)UILabel *k_followingNum;
@property(nonatomic,strong)UILabel *k_likesNum;
@property(nonatomic,strong)UILabel *k_followersNum;
@property(nonatomic,strong)UITableView *k_menu;
@property(nonatomic,strong)UIImageView *k_imgAsideInfor;

@end

@implementation SHTpersonViewController
-(instancetype)init
{
    if (self=[super init])
    {
        _k_portrait=[[UIImageView alloc]init];
        _k_portrait.image=[UIImage imageNamed:@"1_114"];
        _k_name=[[UILabel alloc]init];
        _k_message=[[UIButton alloc]init];
        _k_infor=[[UILabel alloc]init];
        _k_direction=[[UIButton alloc]init];
        _k_followingNum=[[UILabel alloc]init];
        _k_followingLabel=[[UILabel alloc]init];
        _k_followersLabel=[[UILabel alloc]init];
        _k_followersNum=[[UILabel alloc]init];
        _k_likesLabel=[[UILabel alloc]init];
        _k_likesNum=[[UILabel alloc]init];
        //
        _k_message.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _k_direction.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _k_menu=[[UITableView alloc]init];
        
        //
#pragma mark 信息配置
        _k_name.text=@"Franklin";
        _k_infor.text=@"xxxxxxxx";
        [_k_message setImage:[UIImage imageNamed:@"1_69"] forState:UIControlStateNormal];
        [_k_direction setImage:[UIImage imageNamed:@"1_71"] forState:UIControlStateNormal];
        _k_followingLabel.text=@"Following";
       
        _k_likesLabel.text=@"Like";
       
        _k_followersLabel.text=@"Followers";
        //
        _k_followingNum.text=@"111";
        _k_likesNum.text=@"222";
        _k_followersNum.text=@"121";
        _k_menu.separatorStyle=UITableViewCellSeparatorStyleNone;
        _k_menu.alpha=0.91;
        _k_menu.scrollEnabled=NO;
//        _k_menu.separatorInset=UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
        for (UILabel *obj in @[_k_likesLabel,_k_followersLabel,_k_followingLabel])
        {
            obj.textColor=UIColor.grayColor;
            obj.font=[UIFont fontWithName:@" Courier" size:15];
        }
        //
        for (UILabel *obj in @[_k_likesNum,_k_followersNum,_k_followingNum])
        {
           
            obj.font=[UIFont fontWithName:@"Arial-BoldMT" size:25];
        }
        _k_menu.delegate=self;
        _k_menu.dataSource=self;
//
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    CALayer *backLayer=[[CALayer alloc]init];
//    backLayer.backgroundColor=.CGColor;
//    [self.view.layer addSublayer:backLayer];
    self.view.backgroundColor=[UIColor colorWithRed:95/255.0 green:115/255.0 blue:169/255.0 alpha:1];
    CALayer *transparent=[[CALayer alloc]init];
    transparent.frame=CGRectMake(20, 100, SCREENWIDTH_SHT-40, SCREENHEIGHT_SHT-100);
    transparent.backgroundColor=[UIColor colorWithRed:224/255.0 green:227/255.0 blue:238/255.0 alpha:1].CGColor;
    transparent.cornerRadius=10;
    [self.view.layer addSublayer:transparent];
    //
    [self setUpUi];
    // Do any additional setup after loading the view.
}
-(void)setUpUi
{
   [ self.view sd_addSubviews:@[_k_portrait,_k_name,_k_infor,_k_followingNum,_k_followingLabel,_k_followersLabel,_k_followersNum,_k_likesLabel,_k_likesNum,_k_menu,_k_message,_k_direction]];
    //
    _k_portrait.sd_layout.centerXEqualToView(self.view)
    .topSpaceToView(self.view, 40*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(100*WIDTH_LzgDevicePixlesHandle)
    .heightEqualToWidth();
//    NSLog(@"%lf",WIDTH_LzgDevicePixlesHandle);
    //
    _k_name.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(_k_portrait, 10*HEIGHT_LzgDevicePixlesHandle)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_k_name setSingleLineAutoResizeWithMaxWidth:200];
    //
     _k_infor.sd_layout
    .centerXEqualToView(_k_name)
    .topSpaceToView(_k_name, 10*HEIGHT_LzgDevicePixlesHandle)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_k_infor setSingleLineAutoResizeWithMaxWidth:200];
    //
    _k_imgAsideInfor=[[UIImageView alloc]init];
    [_k_imgAsideInfor setImage:[UIImage imageNamed:@"1_55"]];
    _k_imgAsideInfor.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:_k_imgAsideInfor];
    _k_imgAsideInfor.sd_layout
    .rightSpaceToView(_k_infor, 2*WIDTH_LzgDevicePixlesHandle)
    .centerYEqualToView(_k_infor)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle)
    .widthEqualToHeight()
    ;
    //
    _k_message.sd_layout
    .leftSpaceToView(self.view, 100*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(_k_infor, 20*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(60)
    .heightEqualToWidth();
    //
    _k_direction.sd_layout
    .rightSpaceToView(self.view, 100*WIDTH_LzgDevicePixlesHandle)
    .topEqualToView(_k_message)
    .widthRatioToView(_k_message, 1)
    .heightEqualToWidth();
    //
   //
    _k_followingNum.sd_layout
    .topSpaceToView(_k_message, 10*HEIGHT_LzgDevicePixlesHandle)
    .leftSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .heightIs(50);
    [_k_followingNum setSingleLineAutoResizeWithMaxWidth:100];
    //
    _k_followersNum.sd_layout
    .centerXEqualToView(self.view)
    .topEqualToView(_k_followingNum)
    .heightRatioToView(_k_followingNum, 1)
    ;
    [_k_followersNum setSingleLineAutoResizeWithMaxWidth:100];
    //
    _k_followingLabel.sd_layout
    .topSpaceToView(_k_followingNum, 10*HEIGHT_LzgDevicePixlesHandle)
    .centerXEqualToView(_k_followingNum)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_k_followingLabel setSingleLineAutoResizeWithMaxWidth:100];
    //
    
    //
    _k_followersLabel.sd_layout
    .topEqualToView(_k_followingLabel)
    .heightRatioToView(_k_followingLabel, 1)
    .centerXEqualToView(_k_followersNum)
    ;
    [_k_followersLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    //
    //
    _k_likesNum.sd_layout
    .rightSpaceToView(self.view, 50*WIDTH_LzgDevicePixlesHandle)
    .topEqualToView(_k_followersNum)
    .heightRatioToView(_k_followersNum, 1);
    [_k_likesNum setSingleLineAutoResizeWithMaxWidth:100];
    //
    _k_likesLabel.sd_layout
    .topEqualToView(_k_followersLabel)
    .heightRatioToView(_k_followersLabel, 1)
    .centerXEqualToView(_k_likesNum);
    [_k_likesLabel setSingleLineAutoResizeWithMaxWidth:100];
    //
    
    _k_menu.sd_layout.bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(_k_followingLabel, 20*HEIGHT_LzgDevicePixlesHandle);
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark tableView的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHTMenuCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTMenuCell class])];
    if (cell==nil)
    {
        cell=[[SHTMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTMenuCell class])];
    }
    
    switch (indexPath.row)
    {
            case 0:
            cell.cellInfor.text=@"latest version";
            break;
            case 1:
            cell.cellInfor.text=@"release cache";
            break;
            case 2:
            cell.cellInfor.text=@"Help";
            break;
            case 3:
            cell.cellInfor.text=@"Quit";
            break;
    }
    [cell.cellIndicator setImage:[UIImage imageNamed:@"1_28"]];
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH_SHT-100*WIDTH_LzgDevicePixlesHandle tableView:tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50*HEIGHT_LzgDevicePixlesHandle;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50*HEIGHT_LzgDevicePixlesHandle;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
#pragma mark tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
