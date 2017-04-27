#import "QuestionFactory.h"

/**
 * Just make the Question.
 * The Question class has the function making random question and answer.
 * So, QuestionFactory just make the question.
 */
@implementation QuestionFactory

- (Question *)generateQuestion {
    return [[Question alloc] init];
}

@end
