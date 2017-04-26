#import "ContactList.h"

@implementation ContactList

- (instancetype)init {
    if (self = [super init]) {
        // initialize
        _list = [[NSMutableArray alloc] init];

        Contact *contact1 = [[Contact alloc] initWithNumber:
                             @"Honda Hiroki" email:@"hon87kot12.xp@gmail.com" type:@"Mobile" number:@"604-441-4804"];
        Contact *contact2 = [[Contact alloc] initWithNumber:
                             @"Minna Tomodachi" email:@"everybody.friend@gmail.com" type:@"Home" number:@"307-117-4242"];
        Contact *contact3 = [[Contact alloc] initWithNumber:
                             @"Monkey D Luffy" email:@"gomugomu.hand@kaizoku.com" type:@"Ship" number:@"123-456-7890"];
        [_list addObject:contact1];
        [_list addObject:contact2];
        [_list addObject:contact3];
    }
    return self;
}

- (void) addContact:(Contact*) newContact {
    if (newContact != nil) {
        [_list addObject:newContact];
    }
}

- (Contact*) findByName:(NSString*) name {
    for (int i = 0; i < _list.count; i++) {
        if ([_list[i] equals:name]) {
            return _list[i];
        }
    }
    return nil;
}

- (bool) existsEmail:(NSString*) email {
    for (int i = 0; i < _list.count; i++) {
        Contact *contact = _list[i];
        if ([contact.email isEqualToString:email]) {
            return true;
        }
    }
    return false;
}

- (void) printAllContact {
    for (int i = 0; i < _list.count; i++) {
        NSLog(@"%d - %@", i, [_list[i] getDisplayString]);
    }
}

@end
