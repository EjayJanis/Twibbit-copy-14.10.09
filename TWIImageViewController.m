//
//  TWIImageViewController.m
//  Twibbit
//
//  Created by Fritz Che on 08/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import "TWIImageViewController.h"
#import <Parse/Parse.h>

@interface TWIImageViewController ()

@end

@implementation TWIImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    NSString *title = [NSString stringWithFormat:@"-> %@", senderName];
    self.navigationItem.title = title;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ( [self respondsToSelector:@selector(timeOut)]) {
        [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(timeOut) userInfo:nil repeats:NO];
        }
}

#pragma mark - Helper Methods

- (void)timeOut {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
