//
//  Coin.h
//  cocosDragon
//
//  Created by Kenneth Vittetoe on 4/23/13.
//  Copyright (c) 2013 Island Game Studios. All rights reserved.
//

#import "GameObject.h"

@interface Coin : GameObject
{
    BOOL isEndCoin;
}

@property (nonatomic,assign) BOOL isEndCoin;
@end
