//
// Created by Dani Postigo on 6/6/14.
//

#import <Foundation/Foundation.h>

@interface UIViewController (DPKit)

- (void (^)()) constraintAnimationBlock;
- (void) registerKeyboardWillShow: (SEL) selector;
- (void) registerKeyboardWillHide: (SEL) selector;
- (id) viewControllerFromStoryboard;
- (id) viewControllerFromStoryboard: (NSString *) storyboardName;
- (UITapGestureRecognizer *) addTapBehindRecognizer: (SEL) selector;
- (UITapGestureRecognizer *) addTapBehindRecognizerWithBlock: (void (^)()) block;
- (BOOL) recognizerDidTapBehind: (UITapGestureRecognizer *) sender;
- (UITapGestureRecognizer *) addTapBehindRecognizer;
- (void) embedFullscreenController: (UIViewController *) controller;
- (void) embedFullscreenController: (UIViewController *) controller withInsets: (UIEdgeInsets) insets;
- (void) embedFullscreenView: (UIView *) view;
- (void) embedFullscreenView: (UIView *) view withInsets: (UIEdgeInsets) insets;
- (void) unembedController: (UIViewController *) controller;
- (void) embedController: (UIViewController *) controller inView: (UIView *) parentView;
@end