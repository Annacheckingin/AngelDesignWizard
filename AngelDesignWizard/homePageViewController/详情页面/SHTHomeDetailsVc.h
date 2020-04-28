//
//  SHTHomeDetailsVc.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHTBaseViewControllerWithBackBtn.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^SHTHomedetaisContentmake)(UIImageView *topimage,UILabel *pagetitle,UIImageView *portrait,UILabel *name ,UIImageView *L_T,UIImageView *L_D,UIImageView *R_T,UIImageView *R_D,UILabel *breifContent);
@interface SHTHomeDetailsVc : SHTBaseViewControllerWithBackBtn
@property(nonatomic,readonly)UILabel *pagetitle;
@property(nonatomic,readonly)UIImageView *topimage;
@property(nonatomic,readonly)UIImageView *portrait;
@property(nonatomic,readonly)UILabel *name;
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
@property(nonatomic,strong)UITableView *content;
@property(nonatomic,strong)UITableView *comments;
@property(nonatomic,copy)SHTHomedetaisContentmake contentMake;
@end

NS_ASSUME_NONNULL_END
