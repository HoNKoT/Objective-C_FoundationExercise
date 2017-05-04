#import <Foundation/Foundation.h>


@class Pizza;

@protocol KitchenDelegate

- (bool)order:(Pizza *)pizza;//shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;
- (bool)kitchenShouldUpgradeOrder;
- (bool)assign:(Pizza *)pizza;
- (void)kitchenDidMakePizza;

@end
