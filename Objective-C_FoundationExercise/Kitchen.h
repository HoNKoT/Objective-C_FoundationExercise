#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"
#define MANAGER_COUNT 2
#define MANAGER_HATE_ANCHOVIE 0
#define MANAGER_GOOD_MAN 1

@class Pizza;
@interface Kitchen : NSObject

@property NSArray *managers;
@property id<KitchenDelegate> delegate;
- (bool) order:(Pizza *)pizza;
- (bool) canUpgrade;
- (void) kitchenDidMakePizza;

@end
