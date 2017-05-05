#import <Foundation/Foundation.h>

@interface SnakeAndLaddersPlayer : NSObject

@property (readonly) NSString *name;
@property unsigned int stopSquareNumber;

- (instancetype)initWithPlayerName:(NSString *) name;

@end
