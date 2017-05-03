#import <Foundation/Foundation.h>

@protocol PaymentDelegate

- (NSInteger)processPaymentAmount:(unsigned int) paymentAmount;
- (bool)canPaymentAmount;

@end
