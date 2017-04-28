#import "ThreelowPlayer.h"

@implementation ThreelowPlayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dice = [[NSMutableArray alloc] init];
    }
    return self;
}

- (bool) canHold {
    return _dice.count < HOLD_MAXIMUM;
}

- (NSString *) getHoldDiceString {
    NSMutableString *buf = [[NSMutableString alloc] init];
    for (Dice *dice in _dice) {
        [buf appendString: [dice getDisplayString]];
        [buf appendString: @"  "];
    }
    return buf;
}

- (void) unhold: (unsigned int) index {
    NSInteger realIndex = index - 1;
    if (_dice.count > realIndex) {
        Dice *die = _dice[realIndex];
        [_dice removeObject: die];

    } else {
        printf("The index (%d) does not work!", index);
    }
}

- (void) hold: (Dice *) die {
    if ([self canHold]) {
        [_dice addObject:die];

    } else {
        printf("You can not hold any more!");
    }
    
}

- (unsigned int)getScore {
    unsigned int totalScore = 0;
    for (Dice *die in _dice) {
        totalScore += [die getScore];
    }
    
    return totalScore;
}

- (void)reset {
    _dice = [[NSMutableArray alloc] init];
}

@end
