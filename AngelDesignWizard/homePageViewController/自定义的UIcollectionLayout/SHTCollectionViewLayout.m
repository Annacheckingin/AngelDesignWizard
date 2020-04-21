//
//  SHTCollectionViewLayout.m
//  AngelDesignWizard
//
//  Created by LiZhengGuo on 2020/4/15.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "SHTCollectionViewLayout.h"
@interface SHTCollectionViewLayout ()
//cell的布局信息的数组
@property(nonatomic,strong)NSMutableArray *attributes;
//变量，保存单个cell的左上方X坐标
@property(nonatomic,assign)CGFloat currentX;
//变量，保存单个cell的Y坐标
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
    _currentX=_sectionEdgeinsect.left;
    _currentY=_sectionEdgeinsect.top;
    for (int k=0; k<sectionCount; k++)
    {
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:k inSection:0];
        UICollectionViewLayoutAttributes *at=[self layoutAttributesForItemAtIndexPath:indexPath];
        [_attributes addObject:at];
    }
}
-(CGSize)collectionViewContentSize
{
    if (self.scrollDirection==SHTDirectionHorizental)
    {
//        NSInteger itemCount=[self.collectionView numberOfItemsInSection:0];
//        CGFloat totalWidthOfItem=itemCount*_theItemSize.width;
//        CGSize contentSize=CGSizeMake(_sectionEdgeinsect.left+_sectionEdgeinsect.right+totalWidthOfItem+(itemCount-1)*_theItemGap, _sectionEdgeinsect.top+_sectionEdgeinsect.bottom+_theItemSize.height);
//        return contentSize;
        CGSize contentSize=self.collectionView.frame.size;
               return contentSize;
    }
    if (self.scrollDirection==SHTScrollDirectionVertical)
    {
//        NSInteger itemCount=[self.collectionView numberOfItemsInSection:0];
//        CGFloat totalHeightOfItem=itemCount*_theItemSize.height;
     
//        CGSize contentSize=CGSizeMake(_sectionEdgeinsect.left+_theItemSize.width+_sectionEdgeinsect.right,_sectionEdgeinsect.top+totalHeightOfItem+(itemCount-1)*_theItemGap+_sectionEdgeinsect.bottom);
        CGSize contentSize=self.collectionView.frame.size;
        return contentSize;
    }
    return CGSizeZero;
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
    if (self.scrollDirection==SHTDirectionHorizental)
    {
         _currentX+=theFrame.size.width+_theItemGap;
    }
    else
    {
        _currentY+=theFrame.size.height+_theItemGap;
    }
    return cellAt;
}

@end
