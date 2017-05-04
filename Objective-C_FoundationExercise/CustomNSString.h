#import <Foundation/Foundation.h>

//#define SupportedConsonants @[@"ps", @"ph", @"gl", @"ch", @"sh", @"st", @"th", @"gh"]
#define ConsonantSounds @[@"a", @"i", @"u", @"e", @"o", @"y"]

@interface CustomNSString : NSObject

@property NSString* word;

-(instancetype) initWithString:(NSString *)word;
-(NSString *)stringByPigLatinization;

@end
