//
//  StartViewController.h
//  Rutig Matematik
//
//  Created by Richard Henriksson on 2012-08-29.
//  Copyright (c) 2012 Richard Henriksson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController
- (IBAction)NewGame:(id)sender;
- (IBAction)player1ValPressed:(id)sender;
- (IBAction)player2ValPressed:(id)sender;

@property (nonatomic) int summary;

@property (weak, nonatomic) IBOutlet UILabel *goal;
@property (weak, nonatomic) IBOutlet UILabel *sum;
@property (weak, nonatomic) IBOutlet UILabel *points;

@property (weak, nonatomic) IBOutlet UILabel *player;
@property (weak, nonatomic) IBOutlet UILabel *player1Wait;
@property (weak, nonatomic) IBOutlet UILabel *player2Wait;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *Player1;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *Player2;
@end
