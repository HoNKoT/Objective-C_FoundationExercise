#import "Assignment13.h"
#import "InputUtil.h"
#import "CustomNSString.h"

@implementation Assignment13

- (void)execute {
    NSString *userInput = [InputUtil getInputString:@"Pig Latin > "];
    CustomNSString *custom = [[CustomNSString alloc] initWithString:userInput];
    NSLog(@" output >> %@", [custom stringByPigLatinization]);
}

@end
