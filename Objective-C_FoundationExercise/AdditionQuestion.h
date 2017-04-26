#import <Foundation/Foundation.h>

@interface AdditionQuestion : NSObject

@property int answer1;
@property int answer2;

- (NSString*)generateRandomQuestion;
- (bool)isCorrect: (int) answer;

@end
