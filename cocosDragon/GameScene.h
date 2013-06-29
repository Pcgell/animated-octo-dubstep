//
//  GameScene.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "CCLayer.h"

@interface GameScene : CCLayer
{
    CCLayer* levelLayer;
    CCLabelTTF* scoreLabel;
    CCNode* level;
}
@property (nonatomic,assign) int score;

+(GameScene*) sharedScene;
-(void) handleGameOver;
-(void) handleLevelCompete;
@end
