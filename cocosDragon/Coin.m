//
//  Coin.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Coin.h"
#import "Dragon.h"
#import "GameScene.h"

@implementation Coin
@synthesize isEndCoin;
- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Dragon class]])
    {
        if (isEndCoin)
        {
            // Level is complete!
            [[GameScene sharedScene] handleLevelCompete];
        }
        self.isScheduledForRemove = YES;
    }
}
- (float) radius
{
    return 15;
}
@end
