//
//  Level.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Level.h"
#import "Dragon.h"
#import "GameObject.h"
#define kCJScrollFilterFactor 0.1 
#define kCJDragonTargetOffset 80

@implementation Level
- (void) onEnter
{
    [super onEnter];
    
    // Schedule a selector that is called every frame
    [self schedule:@selector(update:)];
    
    // Make sure touches are enabled
    self.isTouchEnabled = YES;
    CCNode* child;
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[Dragon class]])
        {
            dragon = (Dragon*)child;
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
            [gameObject update];
            
            // Check for collisions with dragon
            if (gameObject != dragon)
            {
                
                if (ccpDistance(gameObject.position, dragon.position) < gameObject.radius + dragon.radius)
                {
                    // Notify the game objects that they have collided
                    [gameObject handleCollisionWith:dragon];
                    [dragon handleCollisionWith:gameObject];
                }
            }
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
    
    // Adjust the position of the layer so dragon is visible
    float yTarget = kCJDragonTargetOffset - dragon.position.y;
    CGPoint oldLayerPosition = self.position;
    
    float xNew = oldLayerPosition.x;
    float yNew = yTarget * kCJScrollFilterFactor + oldLayerPosition.y * (1.0f - kCJScrollFilterFactor);
    
    self.position = ccp(xNew, yNew);
}
- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    dragon.xTarget = touchLocation.x;
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView: [touch view]];
    
    dragon.xTarget = touchLocation.x;
}
@end
