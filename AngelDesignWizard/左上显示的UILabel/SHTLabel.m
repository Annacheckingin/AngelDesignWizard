//
//  LzgLabel.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTLabel.h"

@implementation SHTLabel
- (id)initWithFrame:(CGRect)frame {
    
    return [super initWithFrame:frame];
    
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    textRect.origin.y = bounds.origin.y;
    
    return textRect;
    
}

-(void)drawTextInRect:(CGRect)requestedRect {
    
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:actualRect];
}
-(void)setText:(NSString *)text
{
//    NSString *theString=[text copy];
//    CGSize theContentSize=[theString boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.width) options:NSStringDrawingUsesFontLeading attributes:nil context:nil].size;
//    CGRect theOriginlFrame=self.frame;
//    theOriginlFrame.size=theContentSize;
//    self.frame=theOriginlFrame;
//    [self layoutIfNeeded];
    NSLog(@"%s",sel_getName(_cmd));
    self.heightHandle(text);
    [super setText:text];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
