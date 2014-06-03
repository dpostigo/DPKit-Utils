//
// Created by Dani Postigo on 6/3/14.
//

#import "NSNotification+DPKit.h"


@implementation NSNotification (DPKit)


- (CGFloat)keyboardHeight {
    NSDictionary *keyboardInfo = [self userInfo];
    NSValue *keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    CGFloat keyboardHeight = keyboardFrameBeginRect.size.height;
    return keyboardHeight;

}
@end