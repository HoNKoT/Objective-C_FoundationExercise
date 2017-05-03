#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (NSInteger)processPaymentAmount:(unsigned int) paymentAmount {
    NSLog(@"BY APPLE PAY");
    return paymentAmount;
}
- (bool)canPaymentAmount {
    return arc4random_uniform(2) == 0;
}

@end
