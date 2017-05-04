#import "Assignment11.h"

@implementation Assignment11

- (void)execute {
    Kitchen *kitchen = [[Kitchen alloc] init];
    
    NSLog(@"Menu");
    NSLog(@" - Size    : Altimate / Large / Medium / Small / Micro");
    NSLog(@" - Topping : Cheese / Ham / Pineapple / Kimuti / Tuna / Anchovies");
    
    NSString *userInput = [InputUtil getInputString:@"Hi, what is your order? >"];
    Pizza *pizza = [[Pizza alloc] initWithUserInput:userInput];
    if (pizza != nil && [pizza requireAll]) {
        if ([kitchen order:pizza]) {
            NSLog(@" your order > %@", pizza.description);
            if ([kitchen canUpgrade]) {
                NSLog(@" You can upgrade the pizza size. Try it next time!");
            }
            NSLog(@" ..... (wait a minite) .....");
            [kitchen kitchenDidMakePizza];
            NSLog(@" Here we go! Thanks a million!");
        } else {
            NSLog(@" Sorry, the manager said what he cannot make pizza today.");
        }

    } else {
        NSLog(@"Something wrong!");
    }
}

@end
