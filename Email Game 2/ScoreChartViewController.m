//
//  ScoreChartViewController.m
//  Email Game 2
//
//  Created by Shi Ming Chung on 2/15/15.
//  Copyright (c) 2015 So Freaking Yummy. All rights reserved.
//

#import "ScoreChartViewController.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <FacebookSDK/FacebookSDK.h>


@interface ScoreChartViewController ()

@end

@implementation ScoreChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailScore = 0;
    self.totalScore = 0;
    // Do any additional setup after loading the view.
    FBRequest *me = [[FBRequest alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)emailScorePlus:(UIButton *)sender
{
    self.emailScore += 1;
    self.emailScoreLabel.text = [NSString stringWithFormat:@"%i", self.emailScore];
    self.totalScore += 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];
}

- (IBAction)emailScoreMinus:(UIButton *)sender
{
    self.emailScore -= 1;
    self.emailScoreLabel.text = [NSString stringWithFormat:@"%i", self.emailScore];
    self.totalScore -= 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];
}
- (IBAction)meetingScorePlus:(UIButton *)sender
{
    self.meetingScore += 1;
    self.meetingScoreLabel.text = [NSString stringWithFormat:@"%i", self.meetingScore];
    self.totalScore += 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];
}

- (IBAction)meetingScoreMinus:(UIButton *)sender
{
    self.meetingScore += 1;
    self.meetingScoreLabel.text = [NSString stringWithFormat:@"%i", self.meetingScore];
    self.totalScore -= 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];
}
- (IBAction)actionItemScore:(UIButton *)sender
{
    self.actionItemScore += 1;
    self.actionItemScoreLabel.text = [NSString stringWithFormat:@"%i", self.actionItemScore];
    self.totalScore += 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];
}

- (IBAction)actionItemMinus:(UIButton *)sender
{
    self.actionItemScore += 1;
    self.actionItemScoreLabel.text = [NSString stringWithFormat:@"%i", self.actionItemScore];
    self.totalScore -= 1;
    self.totalScoreLabel.text = [NSString stringWithFormat:@"%i",self.totalScore];

}
- (IBAction)saveButton:(UIButton *)sender
{
    PFObject *score = [PFObject objectWithClassName:@"Score"];
    //There is an error at this line.  Error states that the value is 0
    
//    [score setObject:FBGraphUser.user.name forKey:@"Name"];
    [score setObject:@"totalScore" forKey:@"totalScore"];
    [score saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"Score saved successfully");
    }];
}


@end
