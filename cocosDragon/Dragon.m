//
//  Dragon.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Dragon.h"
#import "Coin.h"
#import "Bomb.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"

#define kCJStartSpeed 8
#define kCJCoinSpeed 8
#define kCJStartTarget 160
#define kCJTargetFilterFactor 0.05
#define kCJSlowDownFactor 0.995
#define kCJGravitySpeed 0.1
#define kCJGameOverSpeed -10
#define KCJBoosterSpeed 16
#define kCJDeltaToRotationFactor 5

@implementation Dragon
@synthesize xTarget;
- (id) init
{
    self = [super init];
    if (!self) return NULL;
    
    xTarget = kCJStartTarget;
    ySpeed = kCJStartSpeed;
    
    return self;
}
- (void) update: (ccTime) delta
{
    // Calculate new position
    CGPoint oldPosition = self.position;
    
    float xNew = xTarget + oldPosition.x; //xTarget * kCJTargetFilterFactor + oldPosition.x * (1-kCJTargetFilterFactor);
    float yNew = oldPosition.y + ySpeed;
    self.position = ccp(xNew,yNew);
    
    // Update the vertical speed
    ySpeed = (ySpeed - kCJGravitySpeed) * kCJSlowDownFactor;
    
    // Tilt the dragon depending on horizontal speed
    float xDelta = xNew - oldPosition.x;
    self.rotation = xDelta * kCJDeltaToRotationFactor;
    
    // Check for game over
    if (ySpeed < kCJGameOverSpeed)
    {
        [[GameScene sharedScene] handleGameOver];
    }
}

- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Coin class]])
    {
        // Took a coin
        ySpeed = kCJCoinSpeed;
        
        [GameScene sharedScene].score += 1;
    }
    else if ([gameObject isKindOfClass:[Bomb class]])
    {
        if (self.position.y > gameObject.position.y) {
            ySpeed += KCJBoosterSpeed;
        }else{
            // Hit a bomb from bottom;
            ySpeed = 0;
        }
        CCBAnimationManager* animationManager = self.userObject;
        NSLog(@"animationManager: %@", animationManager);
        [animationManager runAnimationsForSequenceNamed:@"Hit"];
    }
}

- (float) radius
{
    return 25;
}
@end
