//
//  TWIEditFriendsViewController.m
//  Twibbit
//
//  Created by Fritz Che on 05/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import "TWIEditFriendsViewController.h"

@interface TWIEditFriendsViewController ()

@end

@implementation TWIEditFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            // The find succeeded.
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
        }];
    self.currentUser = [PFUser currentUser];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self isFriend:user]) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    /*
    NSArray *entry = [_messages objectAtIndex:[indexPath row]];
    
    id<SINMessage> message = entry[0];
    MessageTableViewCell *cell = [self dequeOrLoadMessageTableViewCell:[entry[1] intValue]];
    
    cell.message.text = message.text;
    cell.nameLabel.text = message.senderId;
    cell.message.backgroundColor = [UIColor greenColor];
    
    CGRect frame = cell.message.frame;
    frame.size.height = 200;//cell.message.contentSize.height;
    cell.message.frame = frame;*/
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    
    if ([self isFriend:user]) {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        for(PFUser *friend in self.friends)
        {
            if ([friend.objectId isEqualToString:user.objectId]) {
                [self.friends removeObject:friend];
                break;
            }
        }
        
        [friendsRelation removeObject:user];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.friends addObject:user];
        [friendsRelation addObject:user];
    }
    
    
    
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error saving friendRelationship: %@ %@", error, error.userInfo);
        }
    }];
}

- (BOOL)isFriend:(PFUser *)user {
    for(PFUser *friend in self.friends)
    {
        if ([friend.objectId isEqualToString:user.objectId]) {
            return YES;
        }
    }
    return NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.allUsers count];
}

@end
