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


- (void)registerKeyboardWillShow:(SEL)selector {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:selector name:UIKeyboardWillShowNotification object:nil];
}


@end