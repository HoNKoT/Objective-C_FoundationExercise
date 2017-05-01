#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject

@property unsigned int doctorId;
@property NSString *name;
@property NSString *major;

- (instancetype)initWithParameters:(NSString *)name id:(unsigned int)doctorId major:(NSString *)major;
- (void) requestMeducation:(Patient *) patient;

@end
