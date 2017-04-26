#import <Foundation/Foundation.h>
#import "InputUtil.h"
#import "BaseAssignment.h"
#import "Assignment01.h"
#import "Assignment02.h"
#import "Assignment03.h"
#import "Assignment04.h"

#define INITIAL_NAVIGATION_MESSAGE @"Please input assignment# (1-15) > "
#define COMMAND_NOT_AVAILABLE @"Please input assignment# (1-15) > "
#define COMMAND_EXIT @"Please input assignment# (1-15) > "

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int command = 0;
        BaseAssignment *assignment;
        
        do {
            command = [InputUtil getInputInt:INITIAL_NAVIGATION_MESSAGE];
            
            switch (command) {
                case 0:
                    NSLog(COMMAND_EXIT);
                    break;
                case 1:
                    assignment = [[Assignment01 alloc] init];
                    break;
                case 2:
                    assignment = [[Assignment02 alloc] init];
                    break;
                case 3:
                    assignment = [[Assignment03 alloc] init];
                    break;
                case 4:
                    assignment = [[Assignment04 alloc] init];
                    break;
                default:
                    NSLog(COMMAND_NOT_AVAILABLE);
            }
            
            if (assignment != nil) {
                [assignment execute];
            }
            
        } while(command != 0);
    }
    return 0;
}
