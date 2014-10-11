//
//  TWILoginViewController.m
//  Twibbit
//
//  Created by Fritz Che on 04/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import "TWILoginViewController.h"
#import <Parse/Parse.h>

@interface TWILoginViewController ()

@end

@implementation TWILoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 ) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Fill in all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alertview show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (user)
                                            {
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                            }
                                            else
                                            {
                                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                [alertView show];
                                            }
                                        }];
    }

}
@end
