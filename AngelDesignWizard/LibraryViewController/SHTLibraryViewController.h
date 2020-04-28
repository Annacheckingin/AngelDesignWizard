//
//  SHTLibraryViewController.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHTLibraryViewController : SHTBaseViewController
@property(nonatomic,readonly)UILabel *currenCategory;
@property(nonatomic,readonly)UIButton *choseCategory;
@property(nonatomic,readonly)UITableView *displayContent;
-(void)changeTheCurrentDataWithIndex:(NSInteger) index;
@end

NS_ASSUME_NONNULL_END
