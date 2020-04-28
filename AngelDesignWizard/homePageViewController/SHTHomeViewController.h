//
//  SHTHomeViewController.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SHTHomeViewController : SHTBaseViewController
@property(nonatomic,readonly)UILabel *theme;
@property(nonatomic,readonly)UILabel *subtitle;
@property(nonatomic,readonly)UIButton *publishButton;
@property(nonatomic,weak)UICollectionView *collectV;
@end

NS_ASSUME_NONNULL_END
