//
//  ScoreChartViewController.h
//  Email Game 2
//
//  Created by Shi Ming Chung on 2/15/15.
//  Copyright (c) 2015 So Freaking Yummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ScoreChartViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailScoreLabel;
@property(nonatomic) int emailScore;

- (IBAction)emailScorePlus:(UIButton *)sender;
- (IBAction)emailScoreMinus:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UILabel *meetingScoreLabel;
@property (nonatomic) int meetingScore;
- (IBAction)meetingScorePlus:(UIButton *)sender;
- (IBAction)meetingScoreMinus:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *actionItemScoreLabel;
@property(nonatomic)int actionItemScore;
- (IBAction)actionItemScore:(UIButton *)sender;
- (IBAction)actionItemMinus:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UILabel *totalScoreLabel;
@property(nonatomic)int totalScore;
@property(strong, nonatomic) NSMutableArray *scoreForParse;


- (IBAction)saveButton:(UIButton *)sender;

@end
