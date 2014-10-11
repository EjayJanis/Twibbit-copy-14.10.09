//
//  TWIImageViewController.h
//  Twibbit
//
//  Created by Fritz Che on 08/10/14.
//  Copyright (c) 2014 zefritz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TWIImageViewController : UIViewController

@property (nonatomic, strong) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
