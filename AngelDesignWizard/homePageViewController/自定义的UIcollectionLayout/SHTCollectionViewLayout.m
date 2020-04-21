//
//  SHTCollectionViewLayout.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTCollectionViewLayout.h"
@interface SHTCollectionViewLayout ()
@property(nonatomic,strong)NSMutableArray *attributes;
@property(nonatomic,assign)CGFloat currentX;
@property(nonatomic,assign)CGFloat currentY;
@end
@implementation SHTCollectionViewLayout
-(instancetype)init
{
    if (self=[super init])
    {
        _attributes=[NSMutableArray array];
    }
    return self;
}
-(void)prepareLayout
{
    [super prepareLayout];
    
    NSInteger sectionCount=[self.collectionView numberOfItemsInSection:0];
    
    _currentX=_sectionEdgeinsect.top;
    _currentY=_sectionEdgeinsect.left;
                
    for (int k=0; k<sectionCount; k++)
    {
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:k inSection:0];
        UICollectionViewLayoutAttributes *at=[self layoutAttributesForItemAtIndexPath:indexPath];
        [_attributes addObject:at];
    }
}
-(CGSize)collectionViewContentSize
{
    NSInteger itemCount=[self.collectionView numberOfItemsInSection:0];
    CGFloat totalWidthOfItem=itemCount*_theItemSize.width;
    CGSize contentSize=CGSizeMake(_sectionEdgeinsect.left+totalWidthOfItem+_sectionEdgeinsect.right+(itemCount+1)*_theItemGap, _sectionEdgeinsect.top+_sectionEdgeinsect.bottom+_theItemSize.height);
    return contentSize;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    return _attributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *cellAt=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGRect theFrame;
    theFrame.origin=CGPointMake(_currentX, _currentY);
    theFrame.size.height=_theItemSize.height;
    theFrame.size.width=_theItemSize.width;
    cellAt.frame=theFrame;
    _currentX+=theFrame.size.width+_theItemGap;
    return cellAt;
}

@end
