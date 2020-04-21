//
//  SHTCollectionViewLayout.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSInteger, SHTScrollDirection)
{
    SHTDirectionHorizental=1,
    SHTScrollDirectionVertical,
};
@interface SHTCollectionViewLayout : UICollectionViewLayout
@property(nonatomic,assign)UIEdgeInsets sectionEdgeinsect;
@property(nonatomic,assign)CGSize theItemSize;
@property(nonatomic,assign)CGFloat theLineGap;
@property(nonatomic,assign)CGFloat theItemGap;
@property(nonatomic,assign)SHTScrollDirection scrollDirection;
@end

NS_ASSUME_NONNULL_END
