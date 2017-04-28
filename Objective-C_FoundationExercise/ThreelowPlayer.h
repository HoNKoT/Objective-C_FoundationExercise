#import <Foundation/Foundation.h>
#import "Dice.h"

#define HOLD_MAXIMUM 5

@interface ThreelowPlayer : NSObject

@property NSMutableArray *dice;
@property NSString *name;

- (bool) canHold;
- (NSString *) getHoldDiceString;
- (void) unhold: (unsigned int) index;
- (void) hold: (Dice *) die;
- (unsigned int) getScore;
- (void) reset;

@end
