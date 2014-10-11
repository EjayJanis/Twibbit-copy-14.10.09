//
//  TWISignupViewController.h
//  Twibbit
//
//  Created by Fritz Che on 04/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWISignupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signup:(id)sender;

@end
