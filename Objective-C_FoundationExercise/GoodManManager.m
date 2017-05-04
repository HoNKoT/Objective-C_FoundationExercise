#import "GoodManManager.h"
#import "Pizza.h"

@implementation GoodManManager

- (bool)order:(Pizza *)pizza {
    bool ret = pizza.requireAll;
    return ret;
}

- (bool)kitchenShouldUpgradeOrder {
    bool ret = ![super.pizza isSizeOf:Altimate];
    return ret;
}

- (bool)assign:(Pizza *)pizza {
    bool ret = [super assign:pizza];
    return ret;
}

- (void)kitchenDidMakePizza {
    NSLog(@"<<< HAVE A GOOD DAY!! >>>");
    [super deliver];
    [super ready];
}


@end
