#import "SnakeAndLaddersGameHandler.h"
#import "SnakeAndLaddersPlayer.h"
#import "SnakeEvent.h"
#import "LadderEvent.h"
#import "JumpEventDelegate.h"
#import "Dice.h"

@implementation SnakeAndLaddersGameHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        _jumpEvents = [[NSMutableDictionary alloc] init];
        [self removeAllPlayer];
        [self initializeJumpEvent];
        
    }
    return self;
}

- (void) addPlayer:(NSString *)name {
    SnakeAndLaddersPlayer *player1 = [[SnakeAndLaddersPlayer alloc] initWithPlayerName:name];
    [_players addObject:player1];
}

- (void) initializeJumpEvent {
    // initialize snake events
    [self addSnakeEvent:17 to: 7];
    [self addSnakeEvent:64 to:60];
    [self addSnakeEvent:89 to:26];
    [self addSnakeEvent:95 to:75];
    [self addSnakeEvent:99 to:78];
    
    // initialize ladder events
    [self addLadderEvent: 4 to:14];
    [self addLadderEvent: 9 to:31];
    [self addLadderEvent:20 to:38];
    [self addLadderEvent:28 to:84];
    [self addLadderEvent:40 to:59];
    [self addLadderEvent:51 to:67];
    [self addLadderEvent:63 to:81];
}

- (void) addSnakeEvent:(unsigned int)from to:(unsigned int)to {
    SnakeEvent *snakeEvnet = [[SnakeEvent alloc] initWithFromAndTo:from to:to];
    [_jumpEvents setObject:snakeEvnet forKey:[NSNumber numberWithInteger:snakeEvnet.from]];
}

- (void) addLadderEvent:(unsigned int)from to:(unsigned int)to {
    LadderEvent *ladderEvent = [[LadderEvent alloc] initWithFromAndTo:from to:to];
    [_jumpEvents setObject:ladderEvent forKey:[NSNumber numberWithInteger:ladderEvent.from]];
}

- (JumpEventBase *) referJumpEvent:(unsigned int)number {
    return [_jumpEvents objectForKey:[NSNumber numberWithInteger:number]];
}

- (void) rollDie {
    // move to next
    [self nextPlayer];
    
    // roll die
    SnakeAndLaddersPlayer *player = _players[_activePlayerIndex];
    Dice *die = [[Dice alloc] init];
    
    // move the player to next stop
    player.stopSquareNumber += die.number + 1;
    
    // print die info
    NSLog(@"%@ rolled a %lu", player.name, die.number + 1);
    
    // print event if needed
    JumpEventBase *jumpEvent = [self referJumpEvent: player.stopSquareNumber];
    if (jumpEvent != nil) {
        id<JumpEventDelegate> delegate = jumpEvent;
        [delegate displayEvent];

        player.stopSquareNumber = jumpEvent.to;

    } else {
        [self displayActivePlayer];
    }
}

- (void) nextPlayer {
    if (_players.count <= ++_activePlayerIndex) {
        _activePlayerIndex = 0;
    }
}

- (void) displayActivePlayer {
    SnakeAndLaddersPlayer *player = _players[_activePlayerIndex];
    if (player != nil) {
        NSLog(@"%@", player.description);
    }
}

- (void) displayAllPlayersScore {
    NSMutableString *buf = [[NSMutableString alloc] init];
    int index = 0;
    [buf setString:@"Score: "];
    for (SnakeAndLaddersPlayer *player in _players) {
        if (index++ > 0) {
            [buf appendString:@", "];
        }
        [buf appendFormat:@"%@:%u", player.name, player.stopSquareNumber];
    }
    
    NSLog(@"%@", buf);
}

- (bool) someoneGetsGoal {
    for (SnakeAndLaddersPlayer *player in _players) {
        if (player.stopSquareNumber >= GOAL_SQUARE_NUMBER) {
            NSLog(@"%@ won!!", player.name);
            return true;
        }
    }
    
    return false;
}

- (void) removeAllPlayer {
    _players = [[NSMutableArray alloc] init];
    _activePlayerIndex = -1;
}

@end
