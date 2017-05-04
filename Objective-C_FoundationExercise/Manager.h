#import <Foundation/Foundation.h>
#import "Pizza.h"

@interface Manager : NSObject

typedef NS_ENUM (NSUInteger, State) {
    Ready,
    MakingPizza,
    Breaking,
};

@property NSNumber *state;
@property Pizza *pizza;

- (bool) assign:(Pizza *)pizza;
- (void) ready;
- (void) breakTime;

@end
