//
//  ProfileViewController.m
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileContentViewController.h"

@interface ProfileViewController ()

@property (nonatomic, strong) ProfileContentViewController *profileContentVC;

@end

@implementation ProfileViewController
@synthesize profileContentVC;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    profileContentVC = [storyboard instantiateViewControllerWithIdentifier:@"ProfileContentViewController"];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height + 200);
    self.view.clipsToBounds = YES;
    
    [self addChildViewController:profileContentVC];
    [self.scrollView addSubview:profileContentVC.view];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}

- (void)swipeRight {
    [profileContentVC swipeRight];
}

- (void)swipeLeft {
    [profileContentVC swipeLeft];
}

@end
