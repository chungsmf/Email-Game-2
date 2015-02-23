//
//  ViewController.m
//  Email Game 2
//
//  Created by Shi Ming Chung on 2/15/15.
//  Copyright (c) 2015 So Freaking Yummy. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
//CCConstants stores constant variables to ensure that variables are referenced consistently throughout the program.
#import "CCConstants.h"
#import <PFFile.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) FBProfilePictureCropping pictureCropping;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBLoginView *loginView = [[FBLoginView alloc] init];
    //have not figured out readPermissions yet
    loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginView.delegate = self;
    //replaced the code login picture with storyboard FBLoginView uiview.
    //loginView.center = self.view.center;
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Facebook methods

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"the user is %@",user.name);
    self.profilePictureView.profileID = user.objectID;
    self.nameLabel.text = user.name;
    
//    PFObject *score = [PFObject objectWithClassName:@"Score"];
//    //There is an error at this line.  Error states that the value is 0
//    [score setObject:user.name forKey:@"Name"];
//    [score setObject:@"test2" forKey:@"Test2"];
//    [score saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        NSLog(@"Score saved successfully");
//    }];
}

// Logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    self.statusLabel.text = @"You're logged in as";
    
}

// Logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    self.statusLabel.text= @"You're not logged in!";
}


// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSLog(@"%@", [error localizedDescription]);
    NSString *alertMessage, *alertTitle;
    
    // If the user performs an action outside of you app to recover,
    // the SDK provides a message, you just need to surface it.
    // This handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


@end
