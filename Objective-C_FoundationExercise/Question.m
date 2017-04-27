#import "Question.h"

/**
 * I did not make 4 classes for each question.
 */
@implementation Question
- (instancetype)init {
    if (self = [super init]) {
        // get 2 randomly numbers.
        _number1 = arc4random_uniform(UPPER_ANSWER - LOWER_ANSWER) + LOWER_ANSWER;
        _number2 = arc4random_uniform(UPPER_ANSWER - LOWER_ANSWER) + LOWER_ANSWER;
        
        // get question type
        int type = arc4random_uniform(TYPE_MAXIMUM);
        switch (type) {
            case 0: _type = Addition; break;
            case 1: _type = Substruct; break;
            case 2: _type = Division; break;
            case 3: _type = Multiplication; break;
        }
    }
    return self;
}

- (NSString *)getQuestion {
    NSMutableString *buf = [[NSMutableString alloc] init];
    [buf setString: @"Question >> " ];
    [buf appendFormat: @"%d %@ %d = ?",
            _number1,
            GetTypeText(_type),
            _number2];
    return buf;
}

- (void)answerStart {
    // start watching time
    _startTime = [NSDate date];
}

- (void)answerEnd: (NSString *) answer {
    // stop watching time
    _endTime = [NSDate date];

    // get answer
    NSString *madeAnswer = nil;
    switch (_type) {
        case Addition:
            madeAnswer = [NSString stringWithFormat:@"%d",
                      (_number1 + _number2)];
            break;

        case Substruct:
            madeAnswer = [NSString stringWithFormat:@"%d",
                      (_number1 - _number2)];
            break;

        case Division:
            madeAnswer = [NSString stringWithFormat:@"%d",
                      (_number1 / _number2)];
            break;

        case Multiplication:
            madeAnswer = [NSString stringWithFormat:@"%d",
                      (_number1 * _number2)];
            break;
    }
    
    // compare the answer if it's correct or not
    _correct = [madeAnswer isEqualToString:answer];
}

- (NSTimeInterval)getAnswerTime {
    return [_endTime timeIntervalSinceDate:_startTime];
}

@end
