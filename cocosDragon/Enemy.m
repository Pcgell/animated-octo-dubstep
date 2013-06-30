//
//  Enemy.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Enemy.h"
#import "vec2.h"
#import "math.h"


@implementation Enemy
- (void) update: (ccTime) delta {
    kmVec2 up; kmVec2Fill(&up, 0, 1);
    kmVec2 oldPosition;
    oldPosition.x= self.position.x;
    oldPosition.y = self.position.y;
    kmVec2 dir;
    dir.x = self.targetX - self.position.x;
    dir.y = self.targetY - self.position.y;
    kmVec2 result;
    kmVec2Normalize(&result,&dir);
    //float dot =  kmVec2Dot(&result, &up);
    //float theta = acosf(dot)*180/M_PI;
    //self.rotation =  -theta;
    oldPosition.y += 200 * delta * result.y;
    oldPosition.x += 200 * delta * result.x;
    self.position = CGPointMake(oldPosition.x, oldPosition.y);
}
@end
