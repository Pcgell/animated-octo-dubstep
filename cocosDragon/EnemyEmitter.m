//
//  EnemyEmitter.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "EnemyEmitter.h"
#import "CCBReader.h"

@implementation EnemyEmitter
- (void) update:(ccTime)delta
{
    if (self.Delay <= 0) {
        float DICE = CCRANDOM_0_1() * 6.0;
    
        if (DICE > 5){
            //EMIT ENEMY
            CCLayer* Layer = (CCLayer*) self.parent;
            CCBReader* reader
            [Layer addChild:[CCBReader  sceneWithNodeGraphFromFile:@"Enemy.ccbi"]];
            
        }
        
        self.Delay = CCRANDOM_0_1() * 5.0;
    }
    
    self.Delay -= delta;

}
@end
