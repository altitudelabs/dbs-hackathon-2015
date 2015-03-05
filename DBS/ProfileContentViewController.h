//
//  ProfileContentViewController.h
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileContentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *jobTitle;
@property (weak, nonatomic) IBOutlet UILabel *hobby;
@property (weak, nonatomic) IBOutlet UILabel *aboutDetail;




- (void)swipeRight;
- (void)swipeLeft;

@end
