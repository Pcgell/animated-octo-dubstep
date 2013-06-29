//
//  GameObject.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "CCNode.h"

@interface GameObject : CCNode
{
    BOOL isScheduledForRemove;
}
@property (nonatomic,assign) BOOL isScheduledForRemove;
@property (nonatomic,readonly) float radius;

- (void) update;

- (void) handleCollisionWith:(GameObject*)gameObject;
@end
