#import <Foundation/Foundation.h>
#import "JumpEventDelegate.h"

@interface JumpEventBase : NSObject<JumpEventDelegate>

@property (readonly) unsigned int from;
@property (readonly) unsigned int to;

- (instancetype)initWithFromAndTo:(unsigned int)from to:(unsigned int)to;

@end
