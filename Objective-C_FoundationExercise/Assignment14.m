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
        NSString *userInput = [InputUtil getInputString:@"Please type \"roll\" or \"r\""];
        userInput = [userInput lowercaseString];
        if ([userInput isEqualToString:@"roll"] || [userInput isEqualToString:@"r"]) {
            [_gameHandler rollDie];
            [_gameHandler displayActivePlayer];

        } else {
            NSLog(@"Unknown input. Try again!");
        }
    } while (![_gameHandler someoneGetsGoal]);
    
}

@end
