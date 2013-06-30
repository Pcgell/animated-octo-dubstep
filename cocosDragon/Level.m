//
//  Level.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Level.h"
#import "Ship.h"
#import "GameObject.h"
#import "Enemy.h"
#define kCJScrollFilterFactor 0.1 
#define kCJDragonTargetOffset 80

@implementation Level
- (void) onEnter
{
    [super onEnter];
    self.isAccelerometerEnabled = YES;
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
    CCNode* child;
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[Ship class]])
        {
            ship = (Ship*)child;
        }
    }
}

- (void) onExit
{
    [super onExit];
    
    // Remove the scheduled selector
    [self unscheduleAllSelectors];
}
- (void) update:(ccTime)delta
{
    // Iterate through all objects in the level layer
    CCNode* child;
    CCARRAY_FOREACH(self.children, child)
    {
        // Check if the child is a game object
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            // Update all game objects
            [gameObject update:delta];
            
            // Check for collisions with dragon
            if (gameObject != ship)
            {
              
                if (ccpDistance(gameObject.position, ship.position) < gameObject.radius + ship.radius)
                {
                    // Notify the game objects that they have collided
                    [gameObject handleCollisionWith:ship];
                    [ship handleCollisionWith:gameObject];
                }
            }
        }
        
        if([child isKindOfClass:[Enemy class]])
        {
            Enemy* enemy = (Enemy*)child;
            enemy.targetX = ship.position.x;
            enemy.targetY = ship.position.y;
        }
    }
    //NSLog(@"dragon pos x:%f y:%f",dragon.position.x,dragon.position.y);
    // Check for objects to remove
    NSMutableArray* gameObjectsToRemove = [NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[GameObject class]])
        {
            GameObject* gameObject = (GameObject*)child;
            
            if (gameObject.isScheduledForRemove)
            {
                [gameObjectsToRemove addObject:gameObject];
            }
        }
    }
    
    for (GameObject* gameObject in gameObjectsToRemove)
    {
        [self removeChild:gameObject cleanup:YES];
    }
}


- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    //ship.xTarget = touchLocation.x;
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    //ship.xTarget = touchLocation.x;
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    ship.x = 15 * acceleration.y;
    ship.y = 15 * -acceleration.x;
    NSLog(@"%f",acceleration.x);
}


@end
