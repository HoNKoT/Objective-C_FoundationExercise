#import "Assignment05.h"

@implementation Assignment05

- (void)execute {
    NSLog(@"MATH! versin 2.0");
    
    bool breakFlag = false;
    
    // initialize
    QuestionManager *questionManager = [QuestionManager getInstance];
    [questionManager clear];
    
    do {
        // print current score
        NSLog(@"%@", [questionManager getScore]);
        
        // generate ramdom question
        Question *question = [questionManager generateQuestion];
        
        // print question
        [question answerStart];
        NSString *answer = [InputUtil getInputString: [question getQuestion]];
        
        // check the command
        if ([answer localizedCaseInsensitiveContainsString:@"quit"]
            || [answer localizedCaseInsensitiveContainsString:@"q"]) {
            // quit program
            NSLog(@"Thanks for playing!");
            breakFlag = true;
            
        } else {
            // check answer
            [question answerEnd:answer];
        }
        
    } while (!breakFlag);
}

@end
