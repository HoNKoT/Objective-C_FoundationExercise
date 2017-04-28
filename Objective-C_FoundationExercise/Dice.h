#import <Foundation/Foundation.h>

@interface Dice : NSObject

#define NUMBER_MAXIMUM 6

typedef NS_ENUM (NSUInteger, Number) {
    One,
    Two,
    Three,
    Four,
    Five,
    Six
};

// Numberから文字列を取得
#define GetNumberText(number) NumberTextList[number]
// 文字列からNumberを取得
#define GetNumber(numberText) (Number)[NumberTextList indexOfObject:numberText]
// Numberの文字列リスト
#define NumberTextList @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"]

@property Number number;
@property bool isHeld;

- (NSString *) getDisplayString;
- (unsigned int) getScore;

@end
