#import <Foundation/Foundation.h>
#import "BaseAssignment.h"
#import "ContactList.h"
#import "InputUtil.h"

#define NEW @"new"
#define LIST @"list"
#define SHOW @"show"
#define QUIT @"quit"

@interface Assignment04 : BaseAssignment

@property ContactList *list;
- (void) printMenu;
- (void) executeNew;
- (void) executeShow;
- (void) executeList;

@end
