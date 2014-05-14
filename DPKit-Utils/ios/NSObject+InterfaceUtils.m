//
// Created by Dani Postigo on 5/10/14.
//

#import "NSObject+InterfaceUtils.h"

@implementation NSObject (InterfaceUtils)

- (UIInterfaceOrientation) statusOrientation {
    return [[UIApplication sharedApplication] statusBarOrientation];
}


- (BOOL) isLandscapeLeft {
    return self.statusOrientation == UIInterfaceOrientationLandscapeLeft;
}


- (BOOL) isLandscapeRight {
    return self.statusOrientation == UIInterfaceOrientationLandscapeRight;
}


- (BOOL) isLandscape {
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

@end