#import "Kitchen.h"
#import "HateAnchovieManager.h"
#import "GoodManManager.h"

@implementation Kitchen

- (bool)order:(Pizza *)pizza {
    // assign
    int random = arc4random_uniform(MANAGER_COUNT);
    
    _delegate = nil;
    switch (random) {
        case MANAGER_HATE_ANCHOVIE:
            _delegate = [[HateAnchovieManager alloc] init];
            break;
            
        case MANAGER_GOOD_MAN:
            _delegate = [[GoodManManager alloc] init];
            break;
    }
    
    if (_delegate != nil && [_delegate order:pizza]) {
        return [_delegate assign:pizza];
    }
    
    return false;
}

- (bool)canUpgrade {
    return [_delegate kitchenShouldUpgradeOrder];
}

- (void) kitchenDidMakePizza {
    if (_delegate != nil) {
        [_delegate kitchenDidMakePizza];
        
    }
}

@end
