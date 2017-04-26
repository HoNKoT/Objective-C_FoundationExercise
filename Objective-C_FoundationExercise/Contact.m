#import "Contact.h"

@implementation Contact

- (instancetype)initWithNameAndEmail: (NSString*) name email:(NSString*) email{
    if (self = [super init]) {
        _name = name;
        _email = email;
        _numbers = [[NSMutableArray alloc] init];
        _types = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithNumber: (NSString*) name email:(NSString*) email type:(NSString*) type number:(NSString*) number {
    if (self = [super init]) {
        self = [self initWithNameAndEmail:name email:(NSString*) email];
        [_types addObject:type];
        [_numbers addObject:number];
    }
    return self;
}

- (void) addNumber:(NSString*) type number:(NSString*) number {
    [_types addObject:type];
    [_numbers addObject:number];
}

- (bool) equals:(NSString*) name {
    return [name isEqualToString:_name];
}

- (NSString*) getDisplayString {
    NSMutableString *buf = [[NSMutableString alloc] init];
    [buf setString: @"Name: "];
    [buf appendString: _name];
    [buf appendString: @", Email: "];
    [buf appendString: _email];
    for (int i = 0; i < _numbers.count; i++) {
        [buf appendFormat: @", Number%d: %@/%@", (i + 1), _types[i], _numbers[i]];
    }
    
    return buf;
}
@end
