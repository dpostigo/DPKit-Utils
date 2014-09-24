//
// Created by Dani Postigo on 6/3/14.
//

#import "NSNotification+DPKit.h"


@implementation NSNotification (DPKit)

+ (void) keyboardWillShow {

    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillShow:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object: nil];
}

- (CGFloat) keyboardHeight {
    NSDictionary *keyboardInfo = [self userInfo];
    NSValue *keyboardFrameBegin = [keyboardInfo valueForKey: UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    CGFloat keyboardHeight = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)  ? keyboardFrameBeginRect.size.width : keyboardFrameBeginRect.size.height;

    return keyboardHeight;

}

- (NSTimeInterval) keyboardDuration {
    NSNumber *duration = [self.userInfo valueForKey: UIKeyboardAnimationDurationUserInfoKey];
    return [duration doubleValue];

}
@end