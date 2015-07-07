//
//  GameBall.m
//  BallGame
//
//  Created by tanla on 07/07/15.
//  Copyright (c) 2015 tanla. All rights reserved.
//

#import "GameBall.h"

@implementation GameBall
@synthesize ballMovingTimer;
@synthesize ballState;

-(id)initWithFrame:(CGRect)ballRect
{
    self = [super initWithFrame:ballRect];
    if (self) {
        // Initialization code
    }
     self.velocity =1.0;
    
    // Velocity type =0 means each ball equal velocity
    // Velocity type =1 means each ball different velocity
    [self setNewDirectionWithVelocityType:0];
    return self;
}

-(void)startMoving
{
    // Based game pause and resume state the balls will move
    if (ballState  ==YES) {
        ballMovingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scheduleBallTimer:) userInfo:self repeats:YES];
    }
}
-(void)setNewDirectionWithVelocityType:(int)velocityType
{
    // to get different direction
    int randomDir = arc4random()%4;

    if (velocityType==0)
    {
        int xpos =5;
        int ypos =5;
        
        if (randomDir ==0)
        {
            addPos = CGPointMake(xpos,ypos);
        }
        else if (randomDir==1)
        {
            addPos = CGPointMake(-xpos,ypos);
        }
        else if (randomDir==1)
        {
            addPos = CGPointMake(xpos,-ypos);
        }
        else
        {
            addPos = CGPointMake(-xpos,-ypos);
        }

    }
    else
    {
        int xpos =arc4random()%5;
        int ypos =arc4random()%5;

        if (randomDir ==0)
        {
            addPos = CGPointMake(xpos,ypos);
        }
        else if (randomDir==1)
        {
            addPos = CGPointMake(-xpos,ypos);
            
        }
        else if (randomDir==1)
        {
            addPos = CGPointMake(xpos,-ypos);
        }
        else
        {
            addPos = CGPointMake(-xpos,-ypos);
        }

    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int randomRValue = arc4random()%255;
    int randomGValue = arc4random()%255;
    int randomBValue = arc4random()%255;

    // Set random color 
    CGRect bounds = [self bounds];
    [[UIColor colorWithRed:(float)randomRValue/255 green:(float)randomGValue/255 blue:(float)randomBValue/255 alpha:1]set];
    UIRectFill(bounds);
}

-(void)scheduleBallTimer:(NSTimer *)timer
{
    [UIView
     animateWithDuration:0.5
     animations:^{
         self.center = CGPointMake(self.center.x+addPos.x ,self.center.y+ addPos.y);
     }];
    
    
    if(self.center.x > self.superview.frame.size.width-(self.frame.size.width/2) || self.center.x+(self.frame.size.width) < self.superview.frame.origin.x)
        addPos.x = -addPos.x*self.velocity;
    if(self.center.y > self.superview.frame.size.height-(self.frame.size.height/2) || self.center.y+(self.frame.size.height)< self.superview.frame.origin.y)
        addPos.y = -addPos.y*self.velocity;
    
}



@end
