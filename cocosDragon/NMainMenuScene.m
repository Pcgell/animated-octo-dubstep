//
//  NMainMenu.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/29/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "NMainMenuScene.h"
#import "CCBReader.h"

@implementation NMainMenuScene

- (void) pressedPlay:(id)sender
{
    //Load
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    
    // Go to game class
    [[CCDirector sharedDirector]  replaceScene:gameScene];
}

- (void) pressedCredit:(id)sender
{
    //Load
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"CreditScene.ccbi"];
    
    // Go to game class
    [[CCDirector sharedDirector]  replaceScene:gameScene];
}


@end
