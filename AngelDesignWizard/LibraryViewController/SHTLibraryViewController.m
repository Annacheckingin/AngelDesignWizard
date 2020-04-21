//
//  SHTLibraryViewController.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTLibraryViewController.h"

@interface SHTLibraryViewController ()
@property(nonatomic,strong,readwrite)UILabel *currenCategory;
@property(nonatomic,strong,readwrite)UIButton *choseCategory;
@property(nonatomic,strong,readwrite)UITableView *displayContent;
@end

@implementation SHTLibraryViewController
-(instancetype)init
{
    if (self=[super init])
    {
        _currenCategory=[[UILabel alloc]init];
        _currenCategory.text=@"Home furnishing villa";
        _currenCategory.font=[UIFont fontWithName:@"ArialRoundedMTBold" size:15];
        _choseCategory=[[UIButton alloc]init];
        _choseCategory.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_choseCategory setImage:[UIImage imageNamed:@"1_83"] forState:UIControlStateNormal];
        _displayContent=[[UITableView alloc]init];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_currenCategory,_choseCategory,_displayContent]];
//    self.view SHT_a
    [self setUpUi];
    [self uiTest];
    // Do any additional setup after loading the view.
}
-(void)setUpUi
{
    _currenCategory.sd_layout
    .topSpaceToView(self.view, 50*HEIGHT_LzgDevicePixlesHandle)
    .centerXEqualToView(self.view)
    .heightIs(20*HEIGHT_LzgDevicePixlesHandle);
    [_currenCategory setSingleLineAutoResizeWithMaxWidth:200];
    //
    //
    _choseCategory.sd_layout
    .leftSpaceToView(_currenCategory, 5)
    .centerYEqualToView(_currenCategory)
    .widthIs(20)
    .heightEqualToWidth();
    //
    _displayContent.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .topSpaceToView(_currenCategory, 10*HEIGHT_LzgDevicePixlesHandle);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
