#import "Assignment03.h"
#import "Box.h"
#import "AdditionQuestion.h"
#import "ScoreKeeper.h"
#import "InputUtil.h"

@implementation Assignment03

- (void)execute {
    NSLog(@"MATH!");
    
    BOOL breakFlag = NO;
    ScoreKeeper *scoreKeeper = [[ScoreKeeper alloc] init];
    
    do {
        // print score first
        [scoreKeeper printScore];
        
        // generate ramdom question
        AdditionQuestion *question = [[AdditionQuestion alloc] init];
        
        NSString *answer = [InputUtil getInputString: [question generateRandomQuestion]];
        
        if ([answer isEqualToString:@"QUIT"]
            || [answer isEqualToString:@"quit"]
            || [answer isEqualToString:@"q"]
            || [answer isEqualToString:@"Q"]) {
            // quit program
            NSLog(@"Thanks for playing!");
            breakFlag = YES;

        } else {
            // check answer
            if ([question isCorrect:[answer intValue]]) {
                [scoreKeeper right];
            } else {
                [scoreKeeper wrong];
            }
        }
        
    } while (!breakFlag);
}

@end
