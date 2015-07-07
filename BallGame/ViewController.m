//
//  ViewController.m
//  BallGame
//
//  Created by tanla on 07/07/15.
//  Copyright (c) 2015 tanla. All rights reserved.
//

#import "ViewController.h"
#import "GameBall.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    gameBallsArray = [[NSMutableArray alloc]init];
    [self addGameBoxview];
    gameState = YES;
}

//Create box view 
-(void)addGameBoxview
{
    CGRect gameBoxFrame = self.view.frame;
    gameBoxFrame.origin.x = gameBoxFrame.origin.x+60;
    gameBoxFrame.origin.y = gameBoxFrame.origin.y+60;
    gameBoxFrame.size.width = gameBoxFrame.size.width-100;
    gameBoxFrame.size.height = gameBoxFrame.size.height-100;
    
    gameBoxView = [[UIView alloc] initWithFrame:gameBoxFrame];
    // gameBoxView = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 200, 300)];
    
    gameBoxView.backgroundColor = [UIColor darkTextColor];
    [self.view addSubview:gameBoxView];
    
}

// Touches methos
#pragma mark- Touch events
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    for (UIView *view in self.view.subviews)
    {
        //  When touchpoint is inside gamebox view then only create the game ball
        if (view ==gameBoxView &&
            CGRectContainsPoint(gameBoxView.frame, touchLocation))
        {
            CGPoint rootViewPoint = [self.view convertPoint:touchLocation toView:gameBoxView];
            [self createBallAtTouchPoint:rootViewPoint];
        }
    }
}


//Create ball on each touch event
-(void)createBallAtTouchPoint:(CGPoint)touchPoint
{
    int width =40;
    int height =40;
    
    GameBall *gameBall = [[GameBall alloc] initWithFrame:CGRectMake(touchPoint.x-(width/2), touchPoint.y-(height/2), width, height)];
    gameBall.ballState = gameState;
    gameBall.layer.cornerRadius =20.0;
    gameBall.layer.masksToBounds = YES;
    [gameBoxView addSubview:gameBall];
    [gameBall startMoving];
    
    [gameBallsArray addObject:gameBall];
    
}

// Switch between pause and resume states
- (IBAction)pauseOrResumeSelected:(UIButton *)sender {
   
    // If atlease one ball is created then only chnage states
    if (!gameBallsArray.count) {
        return;
    }
    if (sender.tag ==0)
    {
        sender.tag=1;
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        [self pauseAllMovingBalls];
        gameState = NO;
    }
    else
    {
        sender.tag =0;
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
        [self resumeMovingAllBalls];
        gameState = YES;
    }
}

#pragma mark - Game ball pause and resume methods
-(void)pauseAllMovingBalls
{
    for (GameBall *newGameBall in gameBallsArray)
    {
        [newGameBall.ballMovingTimer invalidate];
        newGameBall.ballMovingTimer = nil;
    }
}

-(void)resumeMovingAllBalls
{
    for (GameBall *newGameBall in gameBallsArray)
    {
        newGameBall.ballState = YES;
        [newGameBall startMoving];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
