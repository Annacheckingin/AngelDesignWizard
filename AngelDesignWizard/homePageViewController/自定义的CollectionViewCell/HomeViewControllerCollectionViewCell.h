//
//  HomeViewControllerCollectionViewCell.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/16.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewControllerCollectionViewCell : UICollectionViewCell
@property(nonatomic,readonly)UILabel *authorName;
@property(nonatomic,readonly)UIImageView *authorPortrait;
@property(nonatomic,readonly)UIImageView *mainDisplayPic;
@property(nonatomic,readonly)UILabel *theme;
@property(nonatomic,readonly)UILabel *addtionalContent;
@property(nonatomic,readonly)UILabel *latestTime;
@property(nonatomic,readonly)UIButton *likeIt;
@property(nonatomic,readonly)UIButton *viewMore;

@end

NS_ASSUME_NONNULL_END
