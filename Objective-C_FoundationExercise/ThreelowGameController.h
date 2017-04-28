#import <Foundation/Foundation.h>
#import "ThreelowPlayer.h"
#import "Dice.h"

// TODO check 2,3,4...
#define MAXIMUM_PLAYEARS 1
#define NUMBER_OF_ROLL_DICE 5

@interface ThreelowGameController : NSObject

@property NSMutableArray *players;
@property NSMutableArray *tableDice;
@property ThreelowPlayer *activePlayer;
@property unsigned int activeUserIndex;

- (void) roll;
- (void) moveToNextPlayer;
- (void) printTableDice;
- (void) printHoldDice;
- (void) resetDice;
- (void) hold: (unsigned int) index;
- (void) unhold: (unsigned int) index;
- (unsigned int) getHoldTableDiceCount;
- (void) resetGame;

@end
