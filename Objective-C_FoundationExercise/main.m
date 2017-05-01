#import <Foundation/Foundation.h>
#import "InputUtil.h"
#import "BaseAssignment.h"

#define INITIAL_NAVIGATION_MESSAGE @"Please input assignment# (1-15) > "
#define COMMAND_NOT_AVAILABLE @"Please input assignment# (1-15) > "
#define COMMAND_EXIT @"Please input assignment# (1-15) > "

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *questions = @[
                               @"Assignment01",
                               @"Assignment02",
                               @"Assignment03",
                               @"Assignment04",
                               @"Assignment05",
                               @"Assignment06",
                               @"Assignment07",
                               @"Assignment08",
                               @"Assignment09",
                               @"Assignment10",
                               @"Assignment11",
                               @"Assignment12",
                               @"Assignment13",
                               @"Assignment14",
                               ];
        
        int command = 0;
        BaseAssignment *assignment;
        do {
            command = [InputUtil getInputInt:INITIAL_NAVIGATION_MESSAGE];
            assignment = [[NSClassFromString(questions[command - 1]) alloc]init];

            if (assignment != nil) {
                [assignment execute];
            }
            
        } while(command != 0);
    }
    return 0;
}
