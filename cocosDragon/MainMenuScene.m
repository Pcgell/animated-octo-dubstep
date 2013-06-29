//
//  MainMenuScene.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "MainMenuScene.h"
#import "CCBReader.h"

@implementation MainMenuScene
-(void)pressedPlay:(id)sender
{
    CCScene* gamescene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    [[CCDirector sharedDirector] replaceScene:gamescene];
}
@end
