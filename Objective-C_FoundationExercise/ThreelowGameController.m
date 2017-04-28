#import "ThreelowGameController.h"

@implementation ThreelowGameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
        _tableDice = [[NSMutableArray alloc] init];
        
        // initialize player
        for (int i = 0; i < MAXIMUM_PLAYEARS; i++) {
            ThreelowPlayer *player = [[ThreelowPlayer alloc] init];
            player.name = [[NSString alloc] initWithFormat:@"Player %d", i];
            [_players addObject:player];
        }
        
        _activeUserIndex = 0;
        _activePlayer = _players[_activeUserIndex];
        
        // roll dice
        _tableDice = [[NSMutableArray alloc] init];
        for (int i = 0; i < NUMBER_OF_ROLL_DICE; i++) {
            Dice *die = [[Dice alloc] init];
            [_tableDice addObject:die];
        }
    }
    return self;
}

- (void) roll {
    // finally, roll dice
    _tableDice = [[NSMutableArray alloc] init];
    for (int i = 0; i < NUMBER_OF_ROLL_DICE; i++) {
        Dice *die = [[Dice alloc] init];
        [_tableDice addObject:die];
    }
}

- (void) moveToNextPlayer {
    // Hold the dice that active player held.
    for (Dice *die in _tableDice) {
        if (die.isHeld) {
            [_activePlayer hold:die];
        }
    }
    
    // shift to next player
    _activeUserIndex++;
    if (_activeUserIndex >= MAXIMUM_PLAYEARS) {
        _activeUserIndex = 0;
    }
    _activePlayer = _players[_activeUserIndex];

}

- (void) printTableDice {
    NSLog(@"( * = the die you held )");
    NSMutableString *captionBuf = [[NSMutableString alloc] init];
    NSMutableString *diceBuf = [[NSMutableString alloc] init];

    int index = 1;
    for (Dice *die in _tableDice) {
        [captionBuf appendFormat:@"%d%s ", index, die.isHeld ? "*" : " "];
        [diceBuf appendFormat:@"%@  ", [die getDisplayString]];
        index++;
    }

    NSLog(@"%@", captionBuf);
    NSLog(@"%@", diceBuf);
}

- (void) printHoldDice {
    if (_activePlayer.dice.count == 0) {
        NSLog(@"( EMPTY : you do not hold dice yet )");
    }
    
    NSMutableString *captionBuf = [[NSMutableString alloc] init];
    for (int index = 1; index <= _activePlayer.dice.count; index++) {
        [captionBuf appendFormat:@"%d  ", index];
    }

    NSLog(@"%@", captionBuf);
    NSLog(@"%@", [_activePlayer getHoldDiceString]);
}

- (void) resetDice {
    [_activePlayer reset];
}

/** テーブルダイスをトグル */
- (void) hold: (unsigned int) index {
    if (index >= NUMBER_OF_ROLL_DICE) {
        printf("Out bounds! Make sure the number you typed.");
    }
    
    Dice *die = _tableDice[index - 1];
    if (!die.isHeld) {
        // check hold count
        NSInteger totalHoldCount = _activePlayer.dice.count + [self getHoldTableDiceCount];
        if (totalHoldCount < HOLD_MAXIMUM) {
            die.isHeld = !die.isHeld;
            
        } else {
            printf("It will be over held! You can not hold any more!");
        }
    } else {
        die.isHeld = !die.isHeld;
    }
}

/** プレイヤーダイスを捨てる */
- (void) unhold: (unsigned int) index {
    [_activePlayer unhold:index];
}

- (unsigned int)getHoldTableDiceCount {
    unsigned int count = 0;
    for (Dice *die in _tableDice) {
        if (die.isHeld) {
            count++;
        }
    }
    
    return count;
}

- (void)resetGame {
    for (ThreelowPlayer *player in _players) {
        [player reset];
    }
    _activeUserIndex = 0;
    _activePlayer = _players[_activeUserIndex];
}

@end
