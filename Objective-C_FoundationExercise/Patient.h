#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property NSString *name;
@property bool healthCard;
@property NSMutableArray *symptoms;
@property NSMutableArray *prescriptions;

- (instancetype)initWithParameters:(NSString *)name hasHealthCard:(bool)hasHealthCard;
- (void) addPrescription:(NSString *) prescription;
- (bool) hasPrescriptions;
- (NSString *) getPrescription;

@end
