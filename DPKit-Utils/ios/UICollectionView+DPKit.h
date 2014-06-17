//
// Created by Dani Postigo on 5/19/14.
//

#import <Foundation/Foundation.h>

@interface UICollectionView (DPKit)


@property(nonatomic) CGFloat flowLayoutWidth;
@property(nonatomic) CGFloat flowLayoutHeight;
@property(nonatomic) CGSize flowLayoutSize;
- (void)deselectItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated;
- (NSArray *)cellsForItemsAtIndexPaths:(NSArray *)indexPaths;
- (NSIndexPath *)selectedIndexPath;
- (void)reloadDataSelectingIndexPath:(NSIndexPath *)indexPath;
- (void)reloadDataSelectingIndexPaths:(NSArray *)indexPaths;
- (UICollectionViewFlowLayout *) flowLayoutCopy;
@end