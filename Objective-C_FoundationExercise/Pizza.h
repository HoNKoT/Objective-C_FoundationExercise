#import <Foundation/Foundation.h>

@interface Pizza : NSObject

typedef NS_ENUM (NSUInteger, Topping) {
    Cheese,
    Ham,
    Pineapple,
    Kimuti,
    Tuna,
};

// toppingから文字列を取得
#define GetToppingText(topping) ToppingTextList[topping]
// 文字列からtoppingを取得
#define GetTopping(toppingText) (Topping)[ToppingTextList indexOfObject:toppingText]
// toppingの文字列リスト
#define ToppingTextList @[@"cheese", @"ham", @"pineapple", @"kimuti", @"tuna"]

typedef NS_ENUM (NSUInteger, PizzaSize) {
    Altimate,
    Large,
    Medium,
    Small,
    Micro,
};

// toppingから文字列を取得
#define GetPizzaSizeText(pizzaSize) PizzaSizeTextList[pizzaSize]
// 文字列からtoppingを取得
#define GetPizzaSize(pizzaSizeText) (PizzaSize)[PizzaSizeTextList indexOfObject:pizzaSizeText]
// toppingの文字列リスト
#define PizzaSizeTextList @[@"altimate", @"large", @"medium", @"small", @"micro"]

@property NSString *rawInputString;
@property NSNumber *pizzaSize;
@property NSMutableArray *toppings;

- (instancetype)initWithUserInput:(NSString *) inputText;
- (bool) requireAll;

@end
