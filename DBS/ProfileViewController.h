//
//  ProfileViewController.h
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)swipeRight;
- (void)swipeLeft;

@end
