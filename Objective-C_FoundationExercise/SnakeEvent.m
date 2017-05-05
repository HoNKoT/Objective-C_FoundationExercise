#import "SnakeEvent.h"

@implementation SnakeEvent

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to {
    self = [super initWithFromAndTo:from to:to];
    if (self) {
    }
    return self;
}

- (void)displayEvent {
    NSLog(@"Going to hell!");
    NSLog(@"You went down from %u to %u", super.from, super.to);
}

@end
