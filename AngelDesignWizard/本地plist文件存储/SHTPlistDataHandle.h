//
//  SHTPlistDataHandle.h
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/22.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHTPlistDataHandle : NSObject
@property(nonatomic,readonly)NSString *fileName;
+(instancetype)shareInstance;
-(id)fetchDataWithKey:(NSString *)key;
-(void)changeData:(id)data WithKey:(NSString *)key;
-(void)saveData:(id)data WithKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
