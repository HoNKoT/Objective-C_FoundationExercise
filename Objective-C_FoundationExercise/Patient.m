#import "Patient.h"

@implementation Patient

- (instancetype)initWithParameters:(NSString *)name hasHealthCard:(bool)hasHealthCard {
    self = [super init];
    if (self) {
        _name = name;
        _healthCard = hasHealthCard;
        _prescriptions = [[NSMutableArray alloc] init];
        _symptoms = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addPrescription:(NSString *) prescription {
    [_prescriptions addObject: prescription];
}

- (bool) hasPrescriptions {
    return _prescriptions.count > 0;
}

- (NSString *) getPrescription {
    if ([self hasPrescriptions]) {
        NSString *prescription = _prescriptions[0];
        [_prescriptions removeObject:prescription];
        return prescription;
    }
    
    return nil;
}


@end
