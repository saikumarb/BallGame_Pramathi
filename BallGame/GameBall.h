//
//  GameBall.h
//  BallGame
//
//  Created by tanla on 07/07/15.
//  Copyright (c) 2015 tanla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameBall : UIView
{
    // Position to be added
    CGPoint addPos;
}

@property (nonatomic ,strong)NSTimer *ballMovingTimer;
@property (nonatomic ,assign) CGPoint position;
@property (nonatomic ,assign) CGFloat velocity;
@property BOOL ballState;
-(void)startMoving;

@end
