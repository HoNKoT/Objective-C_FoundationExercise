#import "Assignment01.h"
#import "InputUtil.h"

@implementation Assignment01

- (void)execute {
    int inputInt = [InputUtil getInputInt: @"Type number > "];
    NSString *inputString = [InputUtil getInputString: @"Type string > "];
    
    if ([[inputString pathExtension] isEqualToString:@"?"]) {
        NSLog(@"Answer) I don\'t know... :(");
    } else {
        NSLog(@"You typed %d and %@, eh?", inputInt, inputString);
        NSLog(@"Upper case string : %@", [inputString uppercaseString]);
        NSLog(@"Lower case string: %@", [inputString lowercaseString]);
        NSLog(@"De-Space-lt: %@", [inputString stringByReplacingOccurrencesOfString: @" " withString: @"-"]);
    }
}

@end
