//
// Created by Dani Postigo on 5/19/14.
//

#import <Foundation/Foundation.h>

@interface UICollectionView (DPKit)


@property(nonatomic) CGFloat flowLayoutWidth;
@property(nonatomic) CGFloat flowLayoutHeight;
@property(nonatomic) CGSize flowLayoutSize;
- (UICollectionViewFlowLayout *) flowLayoutCopy;
@end