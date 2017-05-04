#import "HateAnchovieManager.h"

@implementation HateAnchovieManager

- (bool)order:(Pizza *)pizza {
    bool ret = pizza.requireAll && ![pizza hasTopping:Anchovies];
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
    [super deliver];
    [super ready];
}

@end
