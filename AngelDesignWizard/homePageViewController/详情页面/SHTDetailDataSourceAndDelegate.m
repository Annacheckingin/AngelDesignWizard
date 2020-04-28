//
//  SHTDetailDataSourceAndDelegate.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTDetailDataSourceAndDelegate.h"
#import "SHTDetailCell.h"
#import "SHTLabel.h"
 static CGFloat theHeight;
@implementation SHTDetailDataSourceAndDelegate
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSString *str;
    SHTDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTDetailCell class])];
    if (cell==nil)
    {
        cell=[[SHTDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTDetailCell class]) insertT:_listPicsTitle  subPics_Lt_Lb_Rt_R_b:@[_picLeftTopCorner,_picLeftBlow,_picRightTopCorner,_picRightblow] andLabel:_introdutionLabel andBriefLabel:_briefContent];
        str=_briefContent.text;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    _briefContent.text=str;
//    __weak SHTLabel *label=(SHTLabel *)_briefContent;
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    label.heightHandle = ^(NSString * _Nonnull text)
//    {
//        if (text!=nil)
//        {
//                  NSLog(@"%@",label.heightHandle);
//                  NSLog(@"-----%lf",[text sHTHeightInWidth:SCREENWIDTH_SHT-20*WIDTH_LzgDevicePixlesHandle]);
//                     label.sd_resetLayout
//                   .leftEqualToView(_introdutionLabel)
//                     .rightSpaceToView(baseView, 10*WIDTH_LzgDevicePixlesHandle)
//                     .topSpaceToView(_introdutionLabel, 1*HEIGHT_LzgDevicePixlesHandle)
//                     .heightIs([text sHTHeightInWidth:SCREENWIDTH_SHT-20*WIDTH_LzgDevicePixlesHandle]*HEIGHT_LzgDevicePixlesHandle);
//                     if (label.heightHandle==nil)
//                     {
//                         NSLog(@"nil");
//                     }
//                     else
//                     {
//                         NSLog(@"not nil");
//                     }
//        }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH_SHT tableView:tableView];
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_hascomments)
    {
        return 550;
    }
    return 350;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (300+30)*HEIGHT_LzgDevicePixlesHandle;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=UIColor.clearColor;
    [view sd_addSubviews:@[_topimage,_reportBtn,_blockBtn]];
    [_topimage sd_addSubviews:@[_pagetitle,_portrait,_name,_likes]];
    //
    _pagetitle.sd_layout
       .centerXEqualToView(_topimage)
       .topSpaceToView(_topimage, 20*HEIGHT_LzgDevicePixlesHandle+[UIApplication sharedApplication].statusBarFrame.size.height)
       .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
       [_pagetitle setSingleLineAutoResizeWithMaxWidth:250];
       
       //
       _portrait.sd_layout
       .bottomSpaceToView(_topimage, 10*HEIGHT_LzgDevicePixlesHandle)
       .leftSpaceToView(_topimage, 10*WIDTH_LzgDevicePixlesHandle)
       .heightIs(20)
       .widthEqualToHeight();
       //
       _name.sd_layout
       .leftSpaceToView(_portrait, 5)
       .centerYEqualToView(_portrait)
       .heightRatioToView(_portrait, 1);
       [_name setSingleLineAutoResizeWithMaxWidth:150];
       //
       _likes.sd_layout
       .centerYEqualToView(_portrait)
       .heightIs(30)
       .widthEqualToHeight()
       .rightSpaceToView(_topimage, 10);
    //
    _topimage.sd_layout
    .topEqualToView(view)
    .leftEqualToView(view)
    .rightEqualToView(view)
    .heightIs(300*HEIGHT_LzgDevicePixlesHandle);
    //
    _reportBtn.sd_layout
    .leftSpaceToView(view, 10*WIDTH_LzgDevicePixlesHandle)
    .topSpaceToView(_topimage, 10*HEIGHT_LzgDevicePixlesHandle)
    .widthIs(100)
    .heightIs(20);
    //
    _blockBtn.sd_layout
    .leftSpaceToView(_reportBtn, 10)
    .centerYEqualToView(_reportBtn)
    .heightRatioToView(_reportBtn, 1)
    .widthRatioToView(_reportBtn, 1);
    //
    
    
    
    return view;
}
@end
