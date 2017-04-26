//
//  ScoreKeeper.h
//  Objective-C_FoundationExercise
//
//  Created by 本田裕規 on 2017-04-26.
//  Copyright © 2017 本田裕規. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreKeeper : NSObject

@property int rightCount;
@property int wrongCount;

- (void) right;
- (void) wrong;
- (int) getRightCount;
- (int) getWrongCount;
- (void) printScore;

@end
