//
//  StartViewController.m
//  Rutig Matematik
//
//  Created by Richard Henriksson on 2012-08-29.
//  Copyright (c) 2012 Richard Henriksson. All rights reserved.
//

#import "StartViewController.h"
#import "stdlib.h"

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize sum;
@synthesize points;
@synthesize player;
@synthesize player1Wait;
@synthesize player2Wait;
@synthesize Player1;
@synthesize Player2;
@synthesize summary = _summary;
@synthesize goal;


bool p1;
int goalNum;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self reset];
}

- (void)viewDidUnload
{
    [self setPlayer1:nil];
    [self setPlayer2:nil];
    [self setSum:nil];
    [self setGoal:nil];
    [self setPoints:nil];
    [self setPlayer2Wait:nil];
    [self setPlayer1Wait:nil];
    [self setPlayer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)reset
{
    _summary = 0;
    sum.text = [NSString stringWithFormat:@"%d", _summary];
    
    points.text = @"0";
    
    p1 = true;
    player.text = @"Spelare 1";
}

- (IBAction)NewGame:(id)sender {
    
    [self reset];
    [self newRound];
    
    int i = 1;
    for (UIButton *button in Player1)
    {
        [button setTitle:[NSString stringWithFormat:@"%d" , i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:40];
        i++;
    }
    
    for (UIButton *button in Player2)
    {
        i--;
        [button setTitle:[NSString stringWithFormat:@"%d" , i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:40];
    }
}

- (void)newRound
{
    goalNum = arc4random() % 50;
    if(goalNum < 10)
    {
        if(goalNum == 0)
        {
            goalNum = 10;
        }
        else
        {
            goalNum += goalNum;
        }
    }
    goal.text = [NSString stringWithFormat:@"%d", goalNum];
    _summary = 0;
    sum.text = [NSString stringWithFormat:@"%d", _summary];
}

- (void)addPoint
{
    int p = [points.text intValue];
    points.text = [NSString stringWithFormat:@"%d", p+1];
}

- (IBAction)player1ValPressed:(id)sender {
    if(p1)
    {
        player2Wait.hidden = true;
        NSString *val = [(UIButton *)sender currentTitle];
        _summary += [val intValue];
        sum.text = [NSString stringWithFormat:@"%d", _summary];
        
        if(_summary >= goalNum)
        {
            if(_summary == goalNum)
            {
                [self addPoint];
            }
            [self newRound];
        }
        else
        {
            p1 = false;
            player.text = @"Spelare 2";
        }
    }
    else
    {
        player1Wait.hidden = false;
    }

}

- (IBAction)player2ValPressed:(id)sender {
    if(!p1)
    {
        player1Wait.hidden = true;
        NSString *val = [(UIButton *)sender currentTitle];
        _summary += [val intValue];
        sum.text = [NSString stringWithFormat:@"%d", _summary];
        
        if(_summary >= goalNum)
        {
            if(_summary == goalNum)
            {
                [self addPoint];
            }
            [self newRound];
        }
        else
        {
            p1 = true;
            player.text = @"Spelare 1";
        }
    }
    else
    {
        player2Wait.hidden = false;
    }
}
@end
