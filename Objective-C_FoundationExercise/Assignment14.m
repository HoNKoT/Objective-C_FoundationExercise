#import "Assignment14.h"
#import "InputUtil.h"

@implementation Assignment14

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gameHandler = [[SnakeAndLaddersGameHandler alloc] init];
    }
    return self;
}

- (void)execute {
    NSLog(@"WELCOME TO SNAKES & LADDERS");
    
    do {
        // set up player info
        [self setupPlayers];

        // handle game
        bool gameOn = [self gameStart];
        
        // ask continue if someone won in this game
        if (gameOn) {
            NSString *userInput = [InputUtil getInputString:@"Do you want continue? >"];
            userInput = [userInput lowercaseString];
            if ([userInput isEqualToString:@"continue"]) {
                [_gameHandler removeAllPlayer];
                continue;

            } else {
                // playet does not want continue
                break;
            }

        } else {
            // player input quit
            break;
        }
    } while (true);
    
    NSLog(@"Thank you for playing!");
    
}

- (void) setupPlayers {
    do {
        // input user
        NSString *userInput = [InputUtil getInputString:@"Type player's name >"];
        [_gameHandler addPlayer:userInput];
        
        // ask continue or not
        userInput = [InputUtil getInputString:@"Do you want add player more? [No/N] >"];
        userInput = [userInput lowercaseString];
        if ([userInput isEqualToString:@"no"] || [userInput isEqualToString:@"n"]) {
            break;
        }
    } while (true);
}

- (bool) gameStart {
    do {
        NSString *userInput = [InputUtil getInputString:@"Please type \"roll\" or \"r\" >"];
        userInput = [userInput lowercaseString];
        if ([userInput isEqualToString:@"roll"] || [userInput isEqualToString:@"r"]) {
            // roll die and display score
            [_gameHandler rollDie];
            [_gameHandler displayAllPlayersScore];
            
        } else if ([userInput isEqualToString:@"quit"]) {
            // quit a game
            return false;
            
        } else {
            // announce try again
            NSLog(@"Unknown input. Try again!");
        }
    } while (![_gameHandler someoneGetsGoal]);
    
    return true;
}

@end
