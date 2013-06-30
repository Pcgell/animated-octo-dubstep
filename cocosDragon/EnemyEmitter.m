//
//  EnemyEmitter.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/30/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "EnemyEmitter.h"
#import "CCBReader.h"
#import "Level.h"

@implementation EnemyEmitter
- (void) update:(ccTime)delta
{
    if (self.Delay <= 0) {
        float DICE = CCRANDOM_0_1() * 4.0;
    
        if (DICE > 3){
            //EMIT ENEMY
            id el = self.parent;
            
            while (![el isKindOfClass:[ Level class]]) {
                el = self.parent;
        
            }
            /*CCNode* explosion = [CCBReader nodeGraphFromFile:@"Explosion.ccbi"];
            explosion.position = self.position;
            [self.parent addChild:explosion];*/
            
            EnemyLayer = el;
            
            CCNode* enemy = [CCBReader nodeGraphFromFile:@"Enemy.ccbi"];
            enemy.position = self.position;
            [EnemyLayer addChild:enemy];
            
            NSLog(@"%i", EnemyNode.tag);
            
        }
        
        self.Delay = CCRANDOM_0_1() * 3.0;
    }
    
    self.Delay -= delta;

}
@end
