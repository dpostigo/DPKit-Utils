//
// Created by Dani Postigo on 6/6/14.
//

#import "UIViewController+DPKit.h"


@implementation UIViewController (DPKit)

- (void (^)())constraintAnimationBlock {
    return ^{
        [self.view layoutIfNeeded];
    };
}


@end