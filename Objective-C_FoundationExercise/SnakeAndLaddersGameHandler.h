#import <Foundation/Foundation.h>

#define GOAL_SQUARE_NUMBER 100

@interface SnakeAndLaddersGameHandler : NSObject

@property (readonly) NSMutableDictionary *jumpEvents;
@property (readonly) NSMutableArray *players;
@property unsigned int activePlayerIndex;

- (void) rollDie;
- (void) displayAllPlayersScore;
- (bool) someoneGetsGoal;
- (void) addPlayer:(NSString *)name;
- (void) removeAllPlayer;

@end
