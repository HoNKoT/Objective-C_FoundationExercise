#import "InputUtil.h"

@implementation InputUtil

+ (NSString *) getInputString: (NSString *) promptString {
    
    if (promptString != nil) {
        printf("%s\n", [promptString UTF8String]);
    }
    
    char input[255];
    fgets(input, 255, stdin);
    NSString *string = [[NSString stringWithCString:input encoding:4] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return string;
    
}

+ (int) getInputInt: (NSString *) promptString {
    return [[InputUtil getInputString: promptString] intValue];
}

@end
