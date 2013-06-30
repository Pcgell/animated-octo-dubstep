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
#define DELAY 2
#define MAXITEMS 200

@implementation EnemyEmitter
- (void) update:(ccTime)delta
{
    self.EmisionCoolDown = 1;
    
    if (self.Delay <= 0) {
        self.Delay = DELAY;
        float DICE = CCRANDOM_0_1() * 4.0;
    
        if (DICE > 3){
            id el = self.parent;
            
            while (![el isKindOfClass:[ Level class]]) {
                el = self.parent;
        
            }
            
            EnemyLayer = el;
            
            if (EnemyLayer.children.count < 200) {
                CCNode* enemy = [CCBReader nodeGraphFromFile:@"Enemy.ccbi"];
                enemy.position = self.position;
                [EnemyLayer addChild:enemy];
            }
        }
    }

    self.Delay -= delta;
}
@end
