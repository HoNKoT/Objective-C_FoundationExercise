#import "Assignment08.h"

@implementation Assignment08

- (void)execute {
    NSLog(@"Menu");
    NSLog(@" - Size    : Altimate / Large / Medium / Small / Micro");
    NSLog(@" - Topping : Cheese / Ham / Pineapple / Kimuti / Tuna");
    
    NSString *userInput = [InputUtil getInputString:@"Hi, what is your order? >"];
    Pizza *pizza = [[Pizza alloc] initWithUserInput:userInput];
    if (pizza != nil && [pizza requireAll]) {
        NSLog(@" your order > %@", pizza.description);
    } else {
        NSLog(@"Something wrong!");
    }
}

@end
