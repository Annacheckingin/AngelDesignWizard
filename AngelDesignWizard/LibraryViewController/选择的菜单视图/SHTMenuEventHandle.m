//
//  SHTMenuEventHandle.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/24.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTMenuEventHandle.h"
#import "SHTSubMenuCell.h"
@interface SHTMenuEventHandle()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation SHTMenuEventHandle

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SHTSubMenuCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SHTSubMenuCell class])];
    if (cell==nil)
    {
         cell=[[SHTSubMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([SHTSubMenuCell class])];
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

@end
