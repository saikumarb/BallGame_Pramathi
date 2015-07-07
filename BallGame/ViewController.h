//
//  ViewController.h
//  BallGame
//
//  Created by tanla on 07/07/15.
//  Copyright (c) 2015 tanla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //  Game Box view which contains all the balls
    UIView *gameBoxView;
    
    NSMutableArray *gameBallsArray;
    BOOL gameState; // Game pause or resume state variable

}


@end

