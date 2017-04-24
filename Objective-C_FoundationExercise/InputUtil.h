#import <Foundation/Foundation.h>

@interface InputUtil : NSObject

+ (NSString *) getInputString: (NSString *) promptString;

+ (int) getInputInt: (NSString *) promptString;

@end
