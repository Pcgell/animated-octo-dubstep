//
//  EnemyEmitter.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameObject.h"

@interface EnemyEmitter : GameObject
{
    CCNode* EnemyNode;
    CCLayer* EnemyLayer;
}
@property (nonatomic, assign) float Delay;
@property (nonatomic, assign) CCLayer* LevelLayer;

@end
