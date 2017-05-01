#import "Doctor.h"

@implementation Doctor

- (instancetype)initWithParameters:(NSString *)name id:(unsigned int)doctorId major:(NSString *)major
{
    self = [super init];
    if (self) {
        _name = name;
        _doctorId = doctorId;
        _major = major;
    }
    return self;
}

- (void) requestMeducation:(Patient *) patient {
    for (NSString *symptom in patient.symptoms) {
        if ([symptom localizedCaseInsensitiveContainsString:@"cough"]) {
            [patient addPrescription:@"Orange juce"];
        } else if ([symptom localizedCaseInsensitiveContainsString:@"fever"]) {
            [patient addPrescription:@"Apple juce"];
        } else if ([symptom localizedCaseInsensitiveContainsString:@"cancer"]) {
            [patient addPrescription:@"Mango juce"];
        } else if ([symptom localizedCaseInsensitiveContainsString:@"low interigence"]) {
            [patient addPrescription:@"Quiz book"];
        }
    }
}

@end
