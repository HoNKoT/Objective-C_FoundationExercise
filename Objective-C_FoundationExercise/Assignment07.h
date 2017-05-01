#import <Foundation/Foundation.h>
#import "BaseAssignment.h"
#import "Doctor.h"
#import "Patient.h"
#import "InputUtil.h"

@interface Assignment07 : BaseAssignment

@property Doctor *doctor;
@property Patient *patient;

- (Doctor *) initializeDoctor;
- (Patient *) initializePatient;
- (bool) visit;
- (void) treat;

@end
