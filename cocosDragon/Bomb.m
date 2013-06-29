//
//  Bomb.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Bomb.h"
#import "Dragon.h"
#import "CCBReader.h"

@implementation Bomb
- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Dragon class]])
    {
        // Collided with the dragon, remove object and add an explosion instead
        self.isScheduledForRemove = YES;
        
        CCNode* explosion = [CCBReader nodeGraphFromFile:@"Explosion.ccbi"];
        explosion.position = self.position;
        [self.parent addChild:explosion];
    }
    
}
- (float) radius
{
    return 15;
}
@end
