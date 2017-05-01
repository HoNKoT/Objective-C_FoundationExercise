#import "Assignment07.h"

@implementation Assignment07

- (void)execute {
    // initialize doctor first
    _doctor = [self initializeDoctor];
    
    // prepare the patient second
    _patient = [self initializePatient];
    
    // visit action
    if ([self visit]) {
        // treat action
        [self treat];
    }
    
}

- (Doctor *)initializeDoctor {
    // initialize doctor
    Doctor *doctor = [[Doctor alloc] initWithParameters:@"Android" id:19871222 major:@"AI Doctor"];
    
    return doctor;
}

- (Patient *)initializePatient {
    Patient *patient = nil;
    
    // initialize patient (me)
    NSString *name = [InputUtil getInputString:@"Give me your name > "];
    NSString *healthCard = [InputUtil getInputString:@"Do you have a health card? [Y/N] > "];
    
    bool hasHealthCard = [healthCard isEqualToString:@"Y"]
    || [healthCard isEqualToString:@"y"]
    || [healthCard isEqualToString:@"yes"]
    || [healthCard isEqualToString:@"YES"];
    
    patient = [[Patient alloc] initWithParameters:name hasHealthCard:hasHealthCard];
    
    // get symptoms
    do {
        NSString *symptom = [InputUtil getInputString:@"What is your symptom"];
        [patient.symptoms addObject:symptom];
        
        NSString *option = [InputUtil getInputString:@"Do you have more? [Y/N] > "];
        if ([option isEqualToString:@"Y"]
            || [option isEqualToString:@"y"]
            || [option isEqualToString:@"yes"]
            || [option isEqualToString:@"YES"]) {
            continue;
        }
        
        break;
    } while (true);
    
    // get prescriptions if the patient has.
    do {
        NSString *option = [InputUtil getInputString:@"Do you any prescription already? [Y/N] > "];
        if ([option isEqualToString:@"Y"]
            || [option isEqualToString:@"y"]
            || [option isEqualToString:@"yes"]
            || [option isEqualToString:@"YES"]) {

            NSString *prescription = [InputUtil getInputString:@"What kind of prescription do you have? > "];
            [patient addPrescription:prescription];
        }
        
        break;
    } while (true);
    
    return patient;
}

- (bool) visit {
    NSLog(@"Hi, I am a doctor, %@", _doctor.name);
    NSLog(@"Do you have a health card?");
    
    NSLog(@"%@ : %s", _patient.name, _patient.healthCard ? "Yes, I do." : "Unfortunatelly, No.");
    
    if (_patient.healthCard) {
        return true;
    } else {
        NSLog(@"Okay, get out right now.");
        return false;
    }
}

- (void) treat {
    //
    NSLog(@"Then, What is your symptoms?");
    if (_patient.symptoms.count > 0) {
        // print symptoms the patients have
        NSLog(@"%@ : Doc, I have %ld symptoms.", _patient.name, _patient.symptoms.count);
        
        for (int i = 0; i < _patient.symptoms.count; i++) {
            NSLog(@"%@ : %@", _patient.name, _patient.symptoms[i]);
        }
        
        NSLog(@"I see. I am going give you some prescriptions.");
        [_doctor requestMeducation:_patient];
            
    } else {
        NSLog(@"%@ : Doc, actually I don't have any symptom I think.", _patient.name);
    }
    
    // give prescriptions includes the patient already have
    NSLog(@"Here are prescriptions.");
    while ([_patient hasPrescriptions]) {
        NSLog(@"%@", [_patient getPrescription]);
    }
}

@end
