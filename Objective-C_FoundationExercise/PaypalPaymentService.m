#import "PaypalPaymentService.h"

@implementation PaypalPaymentService
- (NSInteger)processPaymentAmount:(unsigned int) paymentAmount {
    NSLog(@"BY PAYPAL");
    return paymentAmount;
}
- (bool)canPaymentAmount {
    return arc4random_uniform(2) == 0;
}
@end
