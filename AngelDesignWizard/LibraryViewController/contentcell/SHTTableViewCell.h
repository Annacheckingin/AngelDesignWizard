//
//  SHTTableViewCell.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/21.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHTTableViewCell : UITableViewCell
@property(nonatomic,readonly)UIImageView *glancePic;
@property(nonatomic,readonly)UIButton *viewFullSize;
@property(nonatomic,readonly)UITextView *sloganText;
@property(nonatomic,readonly)UILabel *author;
@property(nonatomic,readonly)UIButton *blockBtn;
@property(nonatomic,readonly)UIButton *reportBtn;
@property(nonatomic,readonly)UILabel *dateMonth;
@property(nonatomic,readonly)UILabel *dateDay;
@property(nonatomic,readonly)UILabel *score;
-(void)setLikeCount:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
