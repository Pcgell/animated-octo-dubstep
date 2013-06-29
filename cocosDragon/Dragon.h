//
//  Dragon.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameObject.h"

@interface Dragon : GameObject
{
    float ySpeed;
    float xTarget;
}

@property (nonatomic,assign) float xTarget;
@end
