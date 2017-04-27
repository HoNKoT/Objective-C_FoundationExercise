#import "QuestionManager.h"
#import "QuestionFactory.h"

@implementation QuestionManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _questionFactory = [[QuestionFactory alloc] init];
        _questions = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (QuestionManager *)getInstance {
    static QuestionManager *questionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        questionManager = [[QuestionManager alloc] init];
    });

    return questionManager;
}

- (void) clear {
    _questions = [[NSMutableArray alloc] init];
}

- (Question *) generateQuestion {
    Question *question = [[Question alloc] init];
    [_questions addObject:question];
    return question;
}

- (NSUInteger) getTotalQuestionCount {
    return _questions.count;
}

- (NSUInteger) getCorrectCount {
    NSUInteger correctCount = 0;
    for (Question *question in _questions) {
        if (question.correct) {
            correctCount++;
        }
    }
    return correctCount;
}

- (NSUInteger) getWrongCount {
    NSUInteger wrongCount = 0;
    for (Question *question in _questions) {
        if (!question.correct) {
            wrongCount++;
        }
    }
    return wrongCount;
}

- (NSTimeInterval) getTotalTime {
    NSTimeInterval totalInterval = 0;
    for (Question *question in _questions) {
        totalInterval += [question getAnswerTime];
    }
    return totalInterval;
}

- (NSTimeInterval) getAverageTime {
    NSTimeInterval totalInterval = [self getTotalTime];
    return totalInterval / [self getTotalQuestionCount];
}

- (NSString *)getScore {
    NSMutableString *buf = [[NSMutableString alloc] init];
    
    NSInteger total = [self getTotalQuestionCount];
    NSInteger correctCount = [self getCorrectCount];
    NSInteger wrongCount = [self getWrongCount];
    float percentage = 0;
    if (total != 0) {
        percentage = (((float)correctCount / (float)total) * 100);
    }

    [buf appendFormat: @"score: %ld right, %ld wrong, -------- %f%%\n",
            (long)correctCount, (long)wrongCount, percentage];
    [buf appendFormat: @"total time: %ds, average time: %ds",
            (int)[self getTotalTime],
            (int)[self getAverageTime]];
    
    return buf;
}

@end
