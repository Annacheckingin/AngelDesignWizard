//
//  SHTFlowLayout.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/27.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTFlowLayout.h"

@implementation SHTFlowLayout
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
-(void)prepareLayout
{
    [super prepareLayout];
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
-(NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [super layoutAttributesForElementsInRect:rect];
}
-(CGSize)collectionViewContentSize
{
    return [super collectionViewContentSize];
}
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                withScrollingVelocity:(CGPoint)velocity
{
    CGRect recOfNow;
        recOfNow.origin.y=0;
        recOfNow.origin.x=proposedContentOffset.x;
        recOfNow.size=self.collectionView.frame.size;
        NSArray *array=[super layoutAttributesForElementsInRect:recOfNow];
    //    printf("%ld\n",array.count);
        CGFloat theCenter=proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
        CGFloat mindistant=MAXFLOAT;
        for (UICollectionViewLayoutAttributes *attri in array)
        {
            //the Judgement below is absolutely always true
            if (fabs(mindistant)>fabs(attri.center.x-theCenter))
            {
                mindistant=attri.center.x-theCenter;
            }
        }
        proposedContentOffset.x+=mindistant;
    //   printf("%s\n",_cmd);
        return proposedContentOffset;
}
@end
