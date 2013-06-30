//
//  Enemy.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameObject.h"

@interface Enemy : GameObject
    @property (nonatomic, assign) float x;
    @property (nonatomic, assign) float y;
    @property (nonatomic, assign) float targetX;
    @property (nonatomic, assign) float targetY;

@end
