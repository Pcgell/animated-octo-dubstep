//
//  Ship.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/29/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Ship.h"
#import "Enemy.h"
#import "CCBReader.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"

#define SCREENHIGHT 768
#define SCREENWIDTH 1024

@implementation Ship
- (id) init
{
    self.isDead = false;
}

- (void) update: (ccTime) delta {
    CGPoint oldPosition = self.position;
    
    oldPosition.y += self.y + 20 * delta;
    oldPosition.x += self.x + 20 * delta;
    
    if (oldPosition.y > SCREENHIGHT)
        oldPosition.y = SCREENHIGHT;
    
    if (oldPosition.x > SCREENWIDTH)
        oldPosition.x = SCREENWIDTH;
    
    if (oldPosition.y < 0)
        oldPosition.y = 0;
    
    if (oldPosition.x < 0)
        oldPosition.x = 0;
    
    self.position = oldPosition;

}

- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Enemy class]])
    {
        //self.isScheduledForRemove = YES;
        
        
        
        CCBAnimationManager* animationManager = self.userObject;
        
        
        [animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            [[GameScene sharedScene] handleGameOver];
        }];
        
        NSLog(@"animationManager: %@", animationManager);
        [animationManager runAnimationsForSequenceNamed:@"HideShip"];
        
        
        CCNode* explosion = [CCBReader nodeGraphFromFile:@"Explosion.ccbi"];
        explosion.position = self.position;
        [self.parent addChild:explosion];
        

    }
}

- (float) radius
{
    return 25;
}
@end
