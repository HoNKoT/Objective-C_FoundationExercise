//
//  ScoreKeeper.m
//  Objective-C_FoundationExercise
//
//  Created by 本田裕規 on 2017-04-26.
//  Copyright © 2017 本田裕規. All rights reserved.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (instancetype)init {
    if (self = [super init]) {
        _rightCount = 0;
        _wrongCount = 0;
    }
    return self;
}

- (void) right {
    _rightCount++;
}

- (void) wrong {
    _wrongCount++;
}

- (int) getRightCount {
    return _rightCount;
}

- (int) getWrongCount {
    return _wrongCount;
}

- (void) printScore {
    int total = _rightCount + _wrongCount;
    float percentage = 0;
    if (total != 0) {
        percentage = (((float)_rightCount / (float)total) * 100);
    }
    
    NSLog(@"score: %d right, %d wrong, -------- %f%%"
          , _rightCount, _wrongCount, percentage);
    
}

@end
