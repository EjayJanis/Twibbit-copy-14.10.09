//
//  TWILoginViewController.h
//  Twibbit
//
//  Created by Fritz Che on 04/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWILoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;

@end
