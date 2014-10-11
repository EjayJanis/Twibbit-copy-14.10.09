//
//  TWIInboxViewController.h
//  Twibbit
//
//  Created by Fritz Che on 03/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TWIInboxViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) PFObject *selectedMessage;

- (IBAction)logoutButton:(id)sender;



@end
