#import <Foundation/Foundation.h>
#import "JumpEventBase.h"

@interface SnakeEvent : JumpEventBase

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to;

@end
