#import "JumpEventBase.h"

@implementation JumpEventBase

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to {
    self = [super init];
    if (self) {
        _from = from;
        _to = to;
    }
    return self;
}

- (bool)eventNumber:(unsigned int)squareNumber {
    return squareNumber == _from;
}

- (void)displayEvent {
    // fail safe
    NSLog(@"Any jump event happens!");
    NSLog(@"You jumped from %u to %u", _from, _to);
}

@end
