//
//  SHTDetailDataSourceAndDelegate.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTDetailDataSourceAndDelegate.h"
#import "SHTDetailCell.h"
 static CGFloat theHeight;
@implementation SHTDetailDataSourceAndDelegate

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SHTDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTDetailCell class])];
    if (cell==nil)
    {
        cell=[[SHTDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTDetailCell class]) insertT:_listPicsTitle  subPics_Lt_Lb_Rt_R_b:@[_picRightTopCorner,_picLeftBlow,_picRightTopCorner,_picRightblow] andLabel:_introdutionLabel andBriefLabel:_briefContent];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH_SHT tableView:tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return theHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    _pagetitle,_portrait,_name,_likes
//    UIImageView *_topimage=[[UIImageView alloc]init];
//    UILabel *_pagetitle=[[UILabel alloc]init];
//    UIImageView *_portrait=[[UIImageView alloc]init];
//    UILabel *_name=[[UILabel alloc]init];
//    UIButton *_likes=[[UIButton alloc]init];
    UIView *view;
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
    
   
    theHeight =_topimage.height+10*HEIGHT_LzgDevicePixlesHandle+20;
    [self tableView:tableView heightForHeaderInSection:section];
    return _topimage;
}
@end
