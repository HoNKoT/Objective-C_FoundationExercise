#import <Foundation/Foundation.h>

@protocol JumpEventDelegate

- (bool)eventNumber:(unsigned int)squareNumber;
- (void)displayEvent;

@end

