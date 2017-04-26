#import "Assignment02.h"
#import "Box.h"

@implementation Assignment02

- (void)execute {
    Box *box1 = [[Box alloc] init];
//    box1.height = 160.0;
//    box1.width = 55.0;
//    box1.length = 10;
    
    NSLog(@"%f", [box1 calculate]);
}

@end
