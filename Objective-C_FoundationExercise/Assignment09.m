#import "Assignment09.h"
#import "FriendlyGreetingDecider.h"

@implementation Assignment09

- (void)execute {
    FriendlyGreetingDecider *a = [[FriendlyGreetingDecider alloc] init];
    self.delegate = a;

    NSLog(@"response %s", [self.delegate shouldSayHello] == YES ? "YES" : "NO");
}

@end
