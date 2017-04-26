#import "AdditionQuestion.h"

#define LOWER_ANSWER 10
#define UPPER_ANSWER 100

@implementation AdditionQuestion

- (instancetype)init {
    if (self = [super init]) {
        _answer1 = arc4random_uniform(UPPER_ANSWER - LOWER_ANSWER) + LOWER_ANSWER;
        _answer2 = arc4random_uniform(UPPER_ANSWER - LOWER_ANSWER) + LOWER_ANSWER;
//        NSMutableString *buf = [NSMutableString	string];
//        [buf setString:@"Qustion:"];
    }
    return self;
}

- (NSString*)generateRandomQuestion {
    return [NSString stringWithFormat:@"%d + %d = ? ", _answer1, _answer2];
}

- (bool)isCorrect: (int)answer {
    return answer == (_answer1 + _answer2);
}

@end
