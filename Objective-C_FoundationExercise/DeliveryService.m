#import "DeliveryService.h"
#import "DeliveryCar.h"

@implementation DeliveryService

- (void) deliverPizza:(Pizza *)pizza {
    DeliveryCar *deliveryCar = [[DeliveryCar alloc] init];
    [deliveryCar deliverPizza:pizza];
}

@end

