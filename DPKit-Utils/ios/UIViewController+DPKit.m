//
// Created by Dani Postigo on 6/6/14.
//

#import <DPKit-UIView/UIView+DPConstraints.h>
#import "UIViewController+DPKit.h"

@implementation UIViewController (DPKit)

- (void (^)()) constraintAnimationBlock {
    return ^{
        [self.view layoutIfNeeded];
    };
}


- (void) registerKeyboardWillShow: (SEL) selector {
    [[NSNotificationCenter defaultCenter] addObserver: self selector: selector name: UIKeyboardWillShowNotification object: nil];
}


- (void) embedFullscreenController: (UIViewController *) controller {
    UIView *view = controller.view;
    [self addChildViewController: controller];
    [self.view addSubview: view];

    view.frame = self.view.bounds;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view updateSuperLeadingConstraint: 0];
    [view updateSuperTrailingConstraint: 0];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self.topLayoutGuide attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0.0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.bottomLayoutGuide attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0.0]];

}

@end