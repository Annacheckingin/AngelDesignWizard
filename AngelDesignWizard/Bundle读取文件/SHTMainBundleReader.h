//
//  SHTMainBundleReader.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;
NS_ASSUME_NONNULL_BEGIN

@interface SHTMainBundleReader : NSObject
+(instancetype)shareInstance;
-(UIImage *)SHTImageWithName:(NSString *)name;
-(NSString *)SHTPlistPathWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
