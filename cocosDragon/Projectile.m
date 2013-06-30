//
//  Projectile.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "Projectile.h"
#import "vec2.h"
#import "Ship.h"

@implementation Projectile
- (void) update: (ccTime) delta {
    
    self.x += 200 * delta;
    self.y += 200 * delta;

}
@end
