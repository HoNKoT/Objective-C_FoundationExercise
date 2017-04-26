#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableArray *types;
@property NSMutableArray *numbers;

- (instancetype) initWithNameAndEmail:(NSString*) name email:(NSString*) email;
- (instancetype) initWithNumber: (NSString*) name email:(NSString*) email type:(NSString*) type number:(NSString*) number;
- (void) addNumber:(NSString*) type number:(NSString*) number;
- (bool) equals:(NSString*) name;
- (NSString*) getDisplayString;
@end
