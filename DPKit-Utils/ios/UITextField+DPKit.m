//
// Created by Dani Postigo on 4/25/14.
//

#import "UITextField+DPKit.h"

@implementation UITextField (DPKit)

+ (void) linkTextFields: (NSArray *) textFields {

    for (int j = 0; j < [textFields count]; j++) {
        UITextField *textField = [textFields objectAtIndex: j];
        //        textField.nextResponder = [textFields objectAtIndex: j + 1];
    }
}
@end