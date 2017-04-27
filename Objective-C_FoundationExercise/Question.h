#import <Foundation/Foundation.h>

#define LOWER_ANSWER 10
#define UPPER_ANSWER 100
#define TYPE_MAXIMUM 4

@interface Question : NSObject

typedef NS_ENUM (NSUInteger, Type) {
    Addition,
    Substruct,
    Division,
    Multiplication
};

// HogeTyoeから文字列を取得
#define GetTypeText(type) TypeTextList[type]
// 文字列からHogeTyoeを取得
#define GetType(typeText) (Type)[TypeTextList indexOfObject:typeText]
// HogeTyoeの文字列リスト
#define TypeTextList @[@"+", @"-", @"/", @"*"]

// for question
@property int number1;
@property int number2;
@property Type type;

// for score
@property bool correct;
@property NSDate *startTime;
@property NSDate *endTime;

- (NSString *) getQuestion;
- (void) answerStart;
- (void) answerEnd:(NSString *) answer;
- (NSTimeInterval) getAnswerTime;

@end
