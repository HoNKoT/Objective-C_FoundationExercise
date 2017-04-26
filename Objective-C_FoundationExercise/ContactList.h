#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

/**
 同じオブジェクトに対してaddすると「きちんと追加される」！
 Box *box = [[Box alloc] init];
 Box *box1 = [[Box alloc] init];
 [_list addObject: box];
 [_list addObject: box];
 NSLog(@"%lu", (unsigned long)_list.count); // output 2
 
 ポインタ参照なので、同じオブジェクトを指しているなら、
 どちらのオブジェクトにも影響を与える
 Box *box_i0 = _list[0];
 box_i0.height = 1;
 Box *box_i1 = _list[1];
 NSLog(@"%f %f", box_i0.height, box_i1.height); // output 1 and 1
 
 削除すると、そのオブジェクトを指すポインタが消える
 [_list addObject:box1];
 [_list removeObject:box];
 NSLog(@"%lu", (unsigned long)_list.count); // output 1
 
 また、indexは詰められる
 Box *box__ = _list[0];
 NSLog(@"%s", box__ == nil ? "nil" : "iiyo"); // can get instance (box1)
 Box *box___ = _list[1];
 NSLog(@"%s", box___ == nil ? "nil" : "iiyo"); // Out bounds Exception!!
 
 */
@property NSMutableArray *list;

- (void) addContact:(Contact*) newContact;
- (Contact*) findByName:(NSString*) name;
- (bool) existsEmail:(NSString*) email;
- (void) printAllContact;

@end
