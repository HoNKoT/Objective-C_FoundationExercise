#import "Manager.h"
#import "DeliveryService.h"

@implementation Manager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _state = [NSNumber numberWithInt:Ready];
    }
    return self;
}

- (bool) assign:(Pizza *)pizza {
    if (_state == [NSNumber numberWithInt:Ready]) {
        _state = [NSNumber numberWithInt:MakingPizza];
        self.pizza = pizza;
        return true;
    }
    return false;
}

- (void) ready {
    _state = [NSNumber numberWithInt:Ready];
}

- (void) breakTime {
    _state = [NSNumber numberWithInt:Breaking];
}

- (void) deliver {
    DeliveryService *deliveryService = [[DeliveryService alloc] init];
    [deliveryService deliverPizza:_pizza];
}
@end
