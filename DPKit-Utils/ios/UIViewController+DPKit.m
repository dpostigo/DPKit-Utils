//
// Created by Dani Postigo on 6/6/14.
//

#import "UIViewController+DPKit.h"
#import "UIGestureRecognizer+BlocksKit.h"


@implementation UIViewController (DPKit)

- (void (^)()) constraintAnimationBlock {
	return ^{
	    [self.view layoutIfNeeded];
	};
}


- (void) registerKeyboardWillShow: (SEL) selector {
	[[NSNotificationCenter defaultCenter] addObserver: self selector: selector name: UIKeyboardWillShowNotification object: nil];
}

- (void) registerKeyboardWillHide: (SEL) selector {
	[[NSNotificationCenter defaultCenter] addObserver: self selector: selector name: UIKeyboardWillHideNotification object: nil];
}

#pragma mark - Storyboards



- (id) viewControllerFromStoryboard {
	return [self viewControllerFromStoryboard: NSStringFromClass([self class])];
}


- (id) viewControllerFromStoryboard: (NSString *) storyboardName {
	NSString *className = NSStringFromClass([self class]);
	id ret = [[UIStoryboard storyboardWithName: storyboardName bundle: nil] instantiateViewControllerWithIdentifier: className];
	return ret;
}


#pragma mark - Tap recognizer

- (UITapGestureRecognizer *) addTapBehindRecognizer {
	return [self addTapBehindRecognizer: @selector(handleTapBehind:)];
}


- (UITapGestureRecognizer *) addTapBehindRecognizer: (SEL) selector {
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: selector];
	recognizer.numberOfTapsRequired = 1;
	recognizer.cancelsTouchesInView = NO;
	[self.view.window addGestureRecognizer: recognizer];
	return recognizer;
}

- (UITapGestureRecognizer *) addTapBehindRecognizerWithBlock: (void (^)()) block {
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] bk_initWithHandler: ^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
	    if (sender.state == UIGestureRecognizerStateEnded) {
		    if (![self.view pointInside: [self.view convertPoint: location fromView: self.view.window]
		                      withEvent: nil]) {
			    if (block) {
				    block();
			    }
		    }
	    }
	}];

	recognizer.numberOfTapsRequired = 1;
	recognizer.cancelsTouchesInView = NO;
	[self.view.window addGestureRecognizer: recognizer];
	return recognizer;
}

- (BOOL) recognizerDidTapBehind: (UITapGestureRecognizer *) sender {
	if (sender.state == UIGestureRecognizerStateEnded) {
		CGPoint location = [sender locationInView: nil];
		if (![self.view pointInside: [self.view convertPoint: location fromView: self.view.window]
		                  withEvent: nil]) {

			return YES;
		}
	}
	return NO;
}


- (void) embedFullscreenController: (UIViewController *) controller {
	[self embedFullscreenController: controller withInsets: UIEdgeInsetsZero];
}


- (void) embedFullscreenController: (UIViewController *) controller withInsets: (UIEdgeInsets) insets {
	if ([self.childViewControllers containsObject: controller]) return;
	UIView *view = controller.view;
	[controller willMoveToParentViewController: self];
	[self addChildViewController: controller];
	[controller didMoveToParentViewController: self];
	[self embedFullscreenView: view withInsets: insets];
}

- (void) embedFullscreenView: (UIView *) view {
	[self embedFullscreenView: view withInsets: UIEdgeInsetsZero];
}

- (void) embedFullscreenView: (UIView *) view withInsets: (UIEdgeInsets) insets {
	[self.view addSubview: view];

	view.frame = self.view.bounds;
	view.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeLeading multiplier: 1.0 constant: insets.left]];
	[self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTrailing relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeTrailing multiplier: 1.0 constant: -insets.right]];
	[self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: self.topLayoutGuide attribute: NSLayoutAttributeTop multiplier: 1.0 constant: insets.top]];
	[self.view addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.bottomLayoutGuide attribute: NSLayoutAttributeTop multiplier: 1.0 constant: -insets.bottom]];
}

- (void) unembedController: (UIViewController *) controller {

	if (![self.childViewControllers containsObject: controller]) return;

	[controller willMoveToParentViewController: nil];
	[controller removeFromParentViewController];
	[controller.view removeFromSuperview];

}

- (void) embedController: (UIViewController *) controller inView: (UIView *) parentView {
	if ([self.childViewControllers containsObject: controller]) return;

	UIView *view = controller.view;
	[controller willMoveToParentViewController: self];
	[self addChildViewController: controller];
	[controller didMoveToParentViewController: self];
	[parentView addSubview: view];

	view.frame = parentView.bounds;
	view.translatesAutoresizingMaskIntoConstraints = NO;

	[parentView addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeLeading relatedBy: NSLayoutRelationEqual toItem: parentView attribute: NSLayoutAttributeLeading multiplier: 1.0 constant: 0.0]];
	[parentView addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTrailing relatedBy: NSLayoutRelationEqual toItem: parentView attribute: NSLayoutAttributeTrailing multiplier: 1.0 constant: 0.0]];
	[parentView addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem: parentView attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0.0]];
	[parentView addConstraint: [NSLayoutConstraint constraintWithItem: view attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: parentView attribute: NSLayoutAttributeBottom multiplier: 1.0 constant: 0.0]];

}


@end