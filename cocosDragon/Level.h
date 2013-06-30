//
//  Level.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "CCLayer.h"
@class Ship;
@interface Level : CCLayer
{
    Ship* ship;
    float seconds;
}


@end
