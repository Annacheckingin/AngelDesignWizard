//
//  LzgLabel.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SHTLabelheight)(NSString * _Nonnull text);
NS_ASSUME_NONNULL_BEGIN
@interface SHTLabel : UILabel
@property(nonatomic,strong)SHTLabelheight heightHandle;
@end

NS_ASSUME_NONNULL_END
