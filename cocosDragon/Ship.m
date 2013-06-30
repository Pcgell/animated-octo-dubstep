//
//  Ship.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/29/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Ship.h"
#define SCREENHIGHT 768
#define SCREENWIDTH 1024

@implementation Ship


- (void) update: (ccTime) delta {
    CGPoint oldPosition = self.position;
    
    oldPosition.y += self.y + 20 * delta;
    oldPosition.x += self.x + 20 * delta;
    
    if (oldPosition.y > SCREENHIGHT)
        oldPosition.y = SCREENHIGHT;
    
    if (oldPosition.x > SCREENWIDTH)
        oldPosition.x = SCREENWIDTH;
    
    if (oldPosition.y < 0)
        oldPosition.y = 0;
    
    if (oldPosition.x < 0)
        oldPosition.x = 0;
    
    self.position = oldPosition;

}
@end
