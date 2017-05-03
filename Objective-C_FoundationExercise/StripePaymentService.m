#import "StripePaymentService.h"

@implementation StripePaymentService
- (NSInteger)processPaymentAmount:(unsigned int) paymentAmount {
    NSLog(@"BY STRIPE");
    return paymentAmount;
}

- (bool)canPaymentAmount {
    return arc4random_uniform(2) == 0;
}
@end
