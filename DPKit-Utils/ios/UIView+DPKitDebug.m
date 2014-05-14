//
// Created by Dani Postigo on 5/7/14.
//

#import "UIView+DPKitDebug.h"

@implementation UIView (DPKitDebug)

- (void) addDebugBorder: (UIColor *) color {
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = color.CGColor;
}


@end