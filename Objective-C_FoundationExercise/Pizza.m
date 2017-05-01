#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithUserInput:(NSString *) inputText
{
    self = [super init];
    if (self) {
        _rawInputString = inputText;
        _toppings = [[NSMutableArray alloc] init];
        [self initialize];
        
    }
    return self;
}

- (void) initialize {
    NSArray *array = [_rawInputString componentsSeparatedByString:@" "];
    
    
    for (NSString *word in array) {
        if ([self isSize:word]) {
            PizzaSize pizzaSize = GetPizzaSize([word lowercaseString]);
            NSNumber *tmp = [NSNumber numberWithInt:pizzaSize];
            _pizzaSize = tmp;
            continue;
        }
        
        if ([self isTopping:word]) {
            Topping topping = GetTopping([word lowercaseString]);
            NSNumber *tmp = [NSNumber numberWithInt:topping];
            [_toppings addObject:tmp];
            continue;
        }
    }
}

- (bool) isSize:(NSString *)word {
    for (NSString *sizeWord in PizzaSizeTextList) {
        if ([word caseInsensitiveCompare:sizeWord] == NSOrderedSame) {
            return true;
        }
    }
    
    return false;
}

- (bool) isTopping:(NSString *)word {
    for (NSString *toppingWord in ToppingTextList) {
        if ([word caseInsensitiveCompare:toppingWord] == NSOrderedSame){
            return true;
        }
    }
    
    return false;
}

- (bool) requireAll {
    return _pizzaSize != nil && _toppings.count > 0;
}

- (NSString *)description{
    if (![self requireAll]) {
        return @"This pizza is unrequired";
    }
    
    NSMutableString *buf = [[NSMutableString alloc] init];
    [buf appendFormat:@"size: %@, topping: ", GetPizzaSizeText([_pizzaSize intValue])];
    for (NSNumber *topping in _toppings) {
        [buf appendFormat:@"%@,", GetToppingText([topping intValue])];
    }
    return buf;
}
@end
