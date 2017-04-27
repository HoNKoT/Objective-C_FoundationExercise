#import <Foundation/Foundation.h>
#import "QuestionFactory.h"

@interface QuestionManager : NSObject

@property QuestionFactory *questionFactory;
@property NSMutableArray *questions;

+ (QuestionManager *)getInstance;
- (void) clear;
- (Question *) generateQuestion;
- (NSUInteger) getTotalQuestionCount;
- (NSUInteger) getCorrectCount;
- (NSUInteger) getWrongCount;
- (NSTimeInterval) getTotalTime;
- (NSTimeInterval) getAverageTime;
- (NSString *) getScore;

@end
