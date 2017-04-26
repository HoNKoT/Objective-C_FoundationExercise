#import "Assignment04.h"

@implementation Assignment04

- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [[ContactList alloc] init];
    }
    return self;
}

- (void)execute {
    
    bool loop = true;
    
    do {
        // print menu
        [self printMenu];
        
        // get input value
        NSString *input = [InputUtil getInputString: nil];

        switch ([input intValue]) {
            case 1: input = NEW; break;
            case 2: input = LIST; break;
            case 3: input = SHOW; break;
            case 9: input = QUIT; break;
            default:
                break;
        }
        
        if ([input localizedCaseInsensitiveContainsString:@"new"]) {
            [self executeNew];

        } else if ([input localizedCaseInsensitiveContainsString:@"list"]) {
            [self executeList];

        } else if ([input localizedCaseInsensitiveContainsString:@"show"]) {
            [self executeShow];

        } else if ([input localizedCaseInsensitiveContainsString:@"quit"]) {
            loop = false;
            NSLog(@"Thank you for playing!");
        }
        
        
        // execute each function
        
    } while(loop);
    
}

- (void) printMenu {
    NSLog(@"What would you like to do next?");
    NSLog(@" 1: new  - Create a new contact");
    NSLog(@" 2: list - List all contacts");
    NSLog(@" 3: show - View contact info along with id");
    NSLog(@" 9: quit - Exit Application");
}

- (void) executeNew {
    printf("CREATE NEW CONTACT\n");
    
    // get name and email
    NSString *name = [InputUtil getInputString:@"NAME > "];
    NSString *email = [InputUtil getInputString:@"EMAIL > "];
    if ([_list existsEmail:email]) {
        // error case
        printf("Sorry the email you typed is already existed.\n");
        return;
    }
    
    // get request what the user wants to get number
    Contact *contact = [[Contact alloc] initWithNameAndEmail:name email:email];
    
    NSString *request = [InputUtil getInputString:@"DO YOU WANT TO ADD CALL NUMBER? [Y/N] > "];
    if ([request isEqualToString:@""]
         || [request localizedCaseInsensitiveContainsString:@"n"]
         || [request localizedCaseInsensitiveContainsString:@"no"]
         || [request localizedCaseInsensitiveContainsString:@"0"]) {
        [_list addContact:contact];
        NSLog(@"NEW CONTACT ADDED!");
        return;
    }
    
    // get number and type
    do {
        NSString *numberType = [InputUtil getInputString:@"NUMBER TYPE > "];
        NSString *number = [InputUtil getInputString:@"CALL NUMBER > "];
        
        if (![numberType isEqualToString:@""] || ![number isEqualToString:@""]) {
            [contact addNumber:numberType number:number];
        }
        
        request = [InputUtil getInputString:@"DO YOU WANT TO ADD MORE CALL NUMBER? [Y/N] > "];
        if ([request isEqualToString:@""]
            || [request localizedCaseInsensitiveContainsString:@"n"]
            || [request localizedCaseInsensitiveContainsString:@"no"]
            || [request localizedCaseInsensitiveContainsString:@"0"]) {
            [_list addContact:contact];
            break;
        }
    } while(true);
}

- (void) executeShow {
    NSString *name = [InputUtil getInputString:@"WHO DO YOU WANT TO SHOW? > "];
    Contact *contact = [_list findByName:name];
    
    if (contact == nil) {
        NSLog(@"COULD NOT FIND OUT %@", name);
    } else {
        NSLog(@"%@", [contact getDisplayString]);
    }
}

- (void) executeList {
    [_list printAllContact];
}

@end
