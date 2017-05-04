#import "CustomNSString.h"

@implementation CustomNSString

- (instancetype)initWithString:(NSString *) word
{
    self = [super init];
    if (self) {
        _word = word;
    }
    return self;
}

-(NSString *)stringByPigLatinization {
    NSMutableString *retBuf = [[NSMutableString alloc] init];
    
    int position = 0;
    bool found = false;
    
    for (; position < _word.length; position++) {
        NSString *tmp_str = [_word substringWithRange:NSMakeRange(position, 1)];

        for (int j = 0; j < ConsonantSounds.count; j++) {
            //NSLog(@"%d - %@ vs %@", position, tmp_str, ConsonantSounds[j]);
            if ([tmp_str isEqualToString: ConsonantSounds[j]]) {
                found = true;
                break;
            }
        }
        
        if (found) {
            break;
        }
    }
    
    if (found) {
        for (int i = position; i < _word.length; i++) {
            NSString *tmp_str = [_word substringWithRange:NSMakeRange(i, 1)];
            if (i == position) {
                tmp_str = [tmp_str uppercaseString];
            } else {
                tmp_str = [tmp_str lowercaseString];
            }
            [retBuf appendString:tmp_str];
        }
        
        for (int i = 0; i < position; i++) {
            NSString *tmp_str = [_word substringWithRange:NSMakeRange(i, 1)];
            tmp_str = [tmp_str lowercaseString];
            [retBuf appendString:tmp_str];
        }
        
        [retBuf appendString:@"ay"];
        return retBuf;

    } else {
        return _word;
    }
}

@end
