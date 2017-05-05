#import "SnakeAndLaddersPlayer.h"

@implementation SnakeAndLaddersPlayer

- (instancetype)initWithPlayerName:(NSString *) name
{
    self = [super init];
    if (self) {
        _name = name;
        _stopSquareNumber = 1;
    }
    return self;
}

- (NSString *)description{
    NSMutableString *buf = [[NSMutableString alloc] init];
    [buf appendFormat:@"Player %@ is landing on %u", _name, _stopSquareNumber];
    return buf;
}

@end
