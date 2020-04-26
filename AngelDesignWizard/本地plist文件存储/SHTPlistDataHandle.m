//
//  SHTPlistDataHandle.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/22.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTPlistDataHandle.h"
#import <objc/runtime.h>
@interface   SHTPlistDataHandle()
@property(nonatomic,strong)NSString *fileName;
@property(nonatomic,strong)NSMutableDictionary *content;
@property(nonatomic,assign)BOOL isFileExsit;
@end
static const NSString *HARDFILENAME=@"hardDataFIleName";
static const char *SHTPlistDataHandleHardFIleAssociateKey="SHTPlistDataHandleHardFIleAssociateKey";
@implementation SHTPlistDataHandle
-(void)k_storeBack
{
    if (_content!=nil)
    {
        [_content writeToFile:[self k_hardFilePath] atomically:YES];
    }
}
+(void)configInitialFileName
{
    NSBundle *mainBundle=[NSBundle mainBundle];
    NSString *seettingFile=[mainBundle pathForResource:@"seettings" ofType:@"plist"];
    NSDictionary *settingDic=[NSDictionary dictionaryWithContentsOfFile:seettingFile];
    NSString *hardFileName=[NSString stringWithFormat:@"%@.plist",settingDic[HARDFILENAME]];
    if (hardFileName==nil||[hardFileName isEqualToString:@""] )
    {
        @throw [NSException exceptionWithName:@"SHTExceptionConfig" reason:@"hardFileName is requried" userInfo:nil];
    }
    else{
        objc_setAssociatedObject(self, SHTPlistDataHandleHardFIleAssociateKey, hardFileName, OBJC_ASSOCIATION_RETAIN);
        
    }
    
}
-(NSString *)k_pathToSandBoxDocumentDirectory
{
    NSFileManager *manager=[NSFileManager defaultManager];
    NSURL *url=[manager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
    NSLog(@"%@",url.path);
    return url.path;
}
+(instancetype)shareInstance
{
    static id me;
    if (me==nil)
    {
        me=[[self alloc]init];
       
    }
    return me;
}
-(NSString *)k_hardFilePath
{
    NSString *hardFileName=objc_getAssociatedObject(self.class, SHTPlistDataHandleHardFIleAssociateKey);
    NSString *documentPath=[self k_pathToSandBoxDocumentDirectory];

    NSString *filepathh=[NSString stringWithFormat:@"%@/%@.plist",documentPath,hardFileName];
    return filepathh;
}
-(void)saveInitializePlistFileWithName
{
    NSString *hardFileName=objc_getAssociatedObject(self.class, SHTPlistDataHandleHardFIleAssociateKey);
    NSString *documentPath=[self k_pathToSandBoxDocumentDirectory];
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:hardFileName ofType:nil]];
    NSFileManager *defaultman=[NSFileManager defaultManager];
    NSString *filepathh=[NSString stringWithFormat:@"%@/%@.plist",documentPath,hardFileName];
    BOOL isfileExsit=[defaultman fileExistsAtPath:filepathh];
    if (!isfileExsit)
    {
        [dic writeToFile:filepathh atomically:YES];
        _isFileExsit=YES;
    }
}
-(id)fetchDataWithKey:(NSString *)key
{
    if (_content==nil)
    {
        if (_isFileExsit)
        {
             _content=[NSMutableDictionary dictionaryWithContentsOfFile:[self k_hardFilePath]];
        }
        else
        {
            return nil;
        }
    }
    return _content[key];
}
-(instancetype)init
{
    if (self=[super init])
    {
         [self saveInitializePlistFileWithName];
    }
    _content=[NSMutableDictionary dictionaryWithContentsOfFile:[self k_hardFilePath]];
    if (_content==nil)
    {
        @throw [NSException exceptionWithName:@"SHTExceptionNil" reason:@"stored data fetch nil" userInfo:nil];
    }
    return self;
}
-(void)saveData:(id)data WithKey:(NSString *)key
{
    if (_content==nil)
    {
        if (_isFileExsit)
        {
             _content=[NSMutableDictionary dictionaryWithContentsOfFile:[self k_hardFilePath]];
        }
    }
    
    [_content setObject:data forKey:key];
    
    [self k_storeBack];
}
-(void)changeData:(id)data WithKey:(NSString *)key
{
    if ([[_content allKeys] containsObject:key])
    {
        [self saveData:data WithKey:key];
    }
    else
    {
       
    }
}
+(void)initialize
{
    [self configInitialFileName];
}
@end
