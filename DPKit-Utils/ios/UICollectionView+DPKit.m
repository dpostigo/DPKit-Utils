//
// Created by Dani Postigo on 5/19/14.
//

#import <DPKit-Utils/UIView+DPKit.h>
#import "UICollectionView+DPKit.h"


@implementation UICollectionView (DPKit)


- (UICollectionViewFlowLayout *) flowLayoutCopy {
    UICollectionViewFlowLayout *currentLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    UICollectionViewFlowLayout *ret = [[UICollectionViewFlowLayout alloc] init];
    ret.itemSize = currentLayout.itemSize;
    ret.sectionInset = currentLayout.sectionInset;
    ret.minimumInteritemSpacing = currentLayout.minimumInteritemSpacing;
    ret.minimumLineSpacing = currentLayout.minimumLineSpacing;
    ret.scrollDirection = currentLayout.scrollDirection;
    ret.footerReferenceSize = currentLayout.footerReferenceSize;
    ret.headerReferenceSize = currentLayout.headerReferenceSize;
    return ret;
}

- (void) setFlowLayoutSize: (CGSize) size {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(size.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right, size.height - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom);
    self.collectionViewLayout = flowLayout;
}

- (CGSize) flowLayoutSize {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    return flowLayout.itemSize;
}


- (void) setFlowLayoutHeight: (CGFloat) aHeight {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(flowLayout.itemSize.width, aHeight - flowLayout.sectionInset.top - flowLayout.sectionInset.bottom);
    self.collectionViewLayout = flowLayout;
}

- (CGFloat) flowLayoutHeight {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    return flowLayout.itemSize.height;
}


- (void) setFlowLayoutWidth: (CGFloat) width {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(width - flowLayout.sectionInset.left - flowLayout.sectionInset.right, flowLayout.itemSize.height);
    self.collectionViewLayout = flowLayout;
}

- (CGFloat) flowLayoutWidth {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    return flowLayout.itemSize.width;
}
@end