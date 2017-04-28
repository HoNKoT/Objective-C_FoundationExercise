#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        int randomNumber = arc4random_uniform(NUMBER_MAXIMUM);
        _number = randomNumber;
    }
    return self;
}

- (NSString *)getDisplayString {
    return GetNumberText(_number);
}

- (unsigned int)getScore {
    switch (_number) {
        case Three:
            return 0;
        default:
            return _number + 1;
    }
}
@end
