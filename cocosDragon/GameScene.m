//
//  GameScene.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameScene.h"
#import "CCBReader.h"

static GameScene* _sharedScene;
@implementation GameScene
@synthesize score = _score;
-(void)setScore:(int)score
{
    _score = score;
    [scoreLabel setString: [@"" stringByAppendingFormat:@"%d",_score]];
}

+(GameScene*) sharedScene
{
    return _sharedScene;
}

-(void) didLoadFromCCB
{
    _sharedScene = self;
    self.score = 0;
    level = [CCBReader nodeGraphFromFile:@"Level.ccbi"];
    [levelLayer addChild:level];
}
-(void) handleGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenuScene.ccbi"]];
}
-(void)handleLevelCompete
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenuScene.ccbi"]];
}
@end
