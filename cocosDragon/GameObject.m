//
//  GameObject.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameObject.h"

@implementation GameObject
@synthesize isScheduledForRemove;

// Update is called for every game object once every frame
- (void) update
{}

// If this game object has collided with another game object this method is called
- (void) handleCollisionWith:(GameObject *)gameObject
{}

// Returns the radius of this game object
- (float) radius
{     return 0;
}

@end
