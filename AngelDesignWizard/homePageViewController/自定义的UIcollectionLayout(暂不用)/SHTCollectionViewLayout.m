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
@property(nonatomic,retain)NSMutableArray *attributes;
//变量，保存单个cell的左上方X坐标
@property(nonatomic,assign)CGFloat currentX;
//变量，保存单个cell的Y坐标
@property(nonatomic,assign)CGFloat currentY;
@property(nonatomic,assign)CGFloat currentScale;
@end
@implementation SHTCollectionViewLayout
-(void)setCellOffset:(CGFloat)cellOffset
{
    if (cellOffset<0)
    {
        cellOffset+=2*(-cellOffset);
    }
    _cellOffset=cellOffset;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
//          _attributes=[NSMutableArray array];
          
    }
    return self;
}
-(void)k_initiaLizeLayoutForPrepare
{
    _currentX=_sectionEdgeinsect.left;
    _currentY=_sectionEdgeinsect.top;
       NSMutableArray *newArray=[NSMutableArray array];
       NSInteger sectionCount=[self.collectionView numberOfItemsInSection:0];
      for (int k=0; k<sectionCount; k++)
      {
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:k inSection:0];
                     UICollectionViewLayoutAttributes *at=[self layoutAttributesForItemAtIndexPath:indexPath];
        [newArray addObject:at];
                 }
       self.attributes=newArray;
}
//此方法也是会被调用相当多的次数，每次都在layoutAttributesForElementsInRect:之前调用，也在contentSize之前调用
-(void)prepareLayout
{
    [super prepareLayout];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self k_initiaLizeLayoutForPrepare];
    });
    
    
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    for (UICollectionViewLayoutAttributes *obj in _attributes)
    {
            CGPoint cellCenter=obj.center;
            CGPoint theLeftTopCorner=self.collectionView.bounds.origin;
            CGFloat theDistantOfCenter=fabs(cellCenter.y-theLeftTopCorner.y);
            CGFloat scaleAdjust=1/(200/theDistantOfCenter);
            if (scaleAdjust>1)
            {
             scaleAdjust=1;
            }
            CGFloat  theScale=(1-0.1*obj.indexPath.row)*scaleAdjust;
//            if (theScale>0.5)
//           {
//              theScale=0.5;
//            }
            self.currentScale=theScale;
            obj.transform=CGAffineTransformMakeScale(theScale, theScale);
          if (theScale==0.5)
          {
              NSMutableArray *newA=[[NSMutableArray alloc]initWithArray:_attributes copyItems:YES];
              [newA insertObject:newA.firstObject atIndex:newA.count-1];
              self.attributes=newA;
          }
    }
    return _attributes;
}
//此方法也会被调用相当多的次数，在prepare之后调用d，但是在layoutAttributesForElementsInRect：之前调用
-(CGSize)collectionViewContentSize
{

    CGSize theSize=CGSizeMake(self.collectionView.width, self.collectionView.height*1.5);
    return theSize;
    if (self.scrollDirection==SHTDirectionHorizental)
    {
        CGSize contentSize=self.collectionView.frame.size;
               return contentSize;
    }
    if (self.scrollDirection==SHTScrollDirectionVertical)
    {
        CGSize contentSize=self.collectionView.frame.size;
        return contentSize;
    }
   CGSize contentSize=self.collectionView.frame.size;
    
    return contentSize;
}
//此方法会被调用相当多的次数，在视图进行滑动的时候,初始的时候也会调用一次


-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//此方法用来获取每个索引处的cell的布局信息，默认并不会进行主动的调用
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [self k_setInitializeWithIndexpath:indexPath];
}
//-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
//{
//
//
//
//
//
//
//}
-(UICollectionViewLayoutAttributes *)k_setInitializeWithIndexpath:(NSIndexPath *)indexPath
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
         CGFloat thedi=40;
         _currentY+=thedi;
         cellAt.zIndex-=30*indexPath.row;
     }
    
     if (self.currentScale==0.5)
     {
         cellAt.zIndex-=30*2;
     }
     return cellAt;
}
@end
