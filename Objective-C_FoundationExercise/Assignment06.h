#import <Foundation/Foundation.h>
#import "BaseAssignment.h"
#import "ThreelowGameController.h"
#import "InputUtil.h"

#define ROLL @"roll"
#define HOLD @"hold"
#define UNHOLD @"unhold"
#define RESET @"reset"
#define NEWGAME @"new game"
#define QUIT @"quit"
#define CANCEL @"cancel"


@interface Assignment06 : BaseAssignment

@property ThreelowGameController *controller;

- (void) executeRoll;
- (void) executeHold;
- (void) executeUnhold;
- (void) executeReset;
- (void) executeNewGame;

@end
