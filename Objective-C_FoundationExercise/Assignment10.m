#import "Assignment10.h"
#import "ApplePaymentService.h"

@implementation Assignment10

-(void)execute {

    int randomPaymentAmount = arc4random_uniform(900) + 100;
    
    NSLog(@"Thank you for shopping at Acme.com Your total today is $%d", randomPaymentAmount);
    NSLog(@"Please select your payment method: 1: Paypal, 2: Stripe, 3: Amazon, 4: Apple Pay");
    
    NSUInteger userInput = [InputUtil getInputInt:@"[1-4] > "];

    id<PaymentDelegate> delegate;
    switch (userInput) {
        case 1:
            delegate = [[PaypalPaymentService alloc] init];
            break;
            
        case 2:
            delegate = [[StripePaymentService alloc] init];
            break;
            
        case 3:
            delegate = [[AmazonPaymentService alloc] init];
            break;
            
        case 4:
            delegate = [[ApplePaymentService alloc] init];
            break;
            
        default:
            NSLog(@"This is unknown value. We can not solve it. sorry.");
            break;
    }
    
    if (delegate != nil) {
        if (delegate.canPaymentAmount) {
            NSInteger retAmount = [delegate processPaymentAmount:randomPaymentAmount];
            NSLog(@"you paid %ld", retAmount);
        } else {
            NSLog(@"You could not pay by this method");
        }
    }
    
}

@end
