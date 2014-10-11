//
//  TWIEditFriendsViewController.h
//  Twibbit
//
//  Created by Fritz Che on 05/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TWIEditFriendsViewController : UITableViewController

@property (nonatomic,strong) NSArray *allUsers;
@property (nonatomic,strong) PFUser *currentUser;
@property (nonatomic,strong) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser *)user;

@end
