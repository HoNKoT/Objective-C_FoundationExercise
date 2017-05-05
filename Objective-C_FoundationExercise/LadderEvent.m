#import "LadderEvent.h"

@implementation LadderEvent

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to {
    self = [super initWithFromAndTo:from to:to];
    if (self) {
    }
    return self;
}

- (void)displayEvent {
    NSLog(@"Stairway to heaven!");
    NSLog(@"You jumped from %u to %u", super.from, super.to);
}

@end
