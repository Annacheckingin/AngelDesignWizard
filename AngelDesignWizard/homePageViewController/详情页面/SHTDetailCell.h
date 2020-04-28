//
//  SHTDetailCell.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/28.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHTDetailCell : UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier insertT:(UILabel *)titile subPics_Lt_Lb_Rt_R_b:(NSArray *)picArray andLabel:(UILabel *)intro andBriefLabel:(UILabel *)breif;
@end

NS_ASSUME_NONNULL_END
