#import "AmazonPaymentService.h"

@implementation AmazonPaymentService
- (NSInteger)processPaymentAmount:(unsigned int) paymentAmount {
    NSLog(@"BY AMOZON PAY");
    return paymentAmount;
}
- (bool)canPaymentAmount {
    return arc4random_uniform(2) == 0;
}
@end
