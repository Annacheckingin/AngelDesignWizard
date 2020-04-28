//
//  SHTMenuEventHandle.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/24.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTMenuEventHandle.h"
#import "SHTSubMenuCell.h"
#import "SHTLibraryViewController.h"
#import "UITableView+SHTBelong.h"
@interface SHTMenuEventHandle()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation SHTMenuEventHandle

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHTLibraryViewController *libVc=(SHTLibraryViewController *)tableView.belongto;
    
          
    [libVc changeTheCurrentDataWithIndex:indexPath.row];
       
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SHTSubMenuCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTSubMenuCell class])];
    if (cell==nil)
    {
         cell=[[SHTSubMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTSubMenuCell class])];
    }
    switch (indexPath.row)
    {
            case 0:
            cell.content.text=@"Hotel Space";
            break;
            case 1:
            cell.content.text=@"Famous Company";
            break;
            case 2:
            cell.content.text=@"Soft Work";
            break;
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH_SHT tableView:tableView];
}
@end
