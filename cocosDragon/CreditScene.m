//
//  CreditScene.m
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 6/29/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "CreditScene.h"
#import "CCBReader.h"

@implementation CreditScene

- (void) pressedMainMenu:(id)sender
{
    //Load
    CCScene* gameScene = [CCBReader sceneWithNodeGraphFromFile:@"NMainMenuScene.ccbi"];
    
    // Go to game class
    [[CCDirector sharedDirector]  replaceScene:gameScene];
}

@end
