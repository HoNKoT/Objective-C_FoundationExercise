#import <Foundation/Foundation.h>
#import "JumpEventBase.h"

@interface LadderEvent : JumpEventBase

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to;

@end
