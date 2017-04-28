#import "Assignment06.h"

@implementation Assignment06

- (instancetype)init
{
    self = [super init];
    if (self) {
        _controller = [[ThreelowGameController alloc] init];
        [_controller roll];
    }
    return self;
}

- (void)execute {
    NSLog(@"Threelow game start!!");

    do {
        // print player name
        NSLog(@"Player : %@ (Score %d)",
              _controller.activePlayer.name,
              [_controller.activePlayer getScore]);

        do {
            // print table dice
            NSLog(@"");
            NSLog(@"Here is table dice.");
            [_controller printTableDice];

            // print hold dice
            NSLog(@"");
            NSLog(@"And, here is the dice you held.");
            [_controller printHoldDice];

            NSString *userInput = [InputUtil getInputString:@"command > "];
            
            // execute command
            if ([userInput isEqualToString:ROLL]) {
                // go to next player
                [self executeRoll];
                break;

            } else if ([userInput isEqualToString:HOLD]) {
                [self executeHold];
                
            } else if ([userInput isEqualToString:UNHOLD]) {
                [self executeUnhold];
                
            } else if ([userInput isEqualToString:RESET]) {
                [self executeReset];
                
            } else if ([userInput isEqualToString:NEWGAME]) {
                [self executeNewGame];
                break;
                
            } else if ([userInput isEqualToString:QUIT]) {
                // game set
                return;
            }
            
            // going to next command
            
        } while(true);
        
    } while (true);
}

- (void) executeRoll {
    NSLog(@"GO TO NEXT!");
    [_controller moveToNextPlayer];
    [_controller roll];
}

- (void) executeHold {
    do {
        // print table dice
        [_controller printTableDice];
        NSLog(@"Which die do you want to hold?");
        
        NSString *userInput = [InputUtil getInputString:@"index (or cancel) > "];
        
        if ([userInput localizedStandardContainsString:CANCEL]) {
            break;

        } else {
            int index = [userInput intValue];
            if (index == 0) {
                // error
                NSLog(@"Unsupported input! Try again.");

            } else {
                // execute command
                [_controller hold:index];
                break;
            }
        }
    } while (true);
}

- (void) executeUnhold {
    do {
        // print table dice
        [_controller printHoldDice];
        NSLog(@"Which die do you want to unhold?");
        
        NSString *userInput = [InputUtil getInputString:@"index (or cancel) > "];
        
        if ([userInput localizedStandardContainsString:CANCEL]) {
            break;
            
        } else {
            int index = [userInput intValue];
            if (index == 0) {
                // error
                NSLog(@"Unsupported input! Try again.");
                
            } else {
                // execute command
                [_controller unhold:index];
                break;
            }
        }
    } while (true);
}

- (void) executeReset {
    [_controller.activePlayer reset];
    [_controller roll];
}

- (void)executeNewGame {
    NSLog(@"New Game");
    [_controller resetGame];
    [_controller roll];
}

@end
