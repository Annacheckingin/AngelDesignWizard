//
//  SHTDetailDataSourceAndDelegate.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHTDetailDataSourceAndDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UILabel *pagetitle;
@property(nonatomic,weak)UIImageView *topimage;
@property(nonatomic,weak)UIImageView *portrait;
@property(nonatomic,weak)UILabel *name;
@property(nonatomic,weak)UIButton *likes;
@property(nonatomic,weak)UIButton *reportBtn;
@property(nonatomic,weak)UIButton *blockBtn;
@property(nonatomic,weak)UILabel *listPicsTitle;
@property(nonatomic,weak)UIImageView *picLeftTopCorner;
@property(nonatomic,weak)UIImageView *picRightTopCorner;
@property(nonatomic,weak)UIImageView *picLeftBlow;
@property(nonatomic,weak)UIImageView *picRightblow;
@property(nonatomic,weak)UILabel *introdutionLabel;
@property(nonatomic,weak)UILabel *briefContent;
@property(nonatomic,strong)UITableView *content;
@property(nonatomic,assign)BOOL hascomments;
@property(nonatomic,weak)NSMutableArray *dataform;
@end

NS_ASSUME_NONNULL_END
