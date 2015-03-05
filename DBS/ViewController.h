//
//  ViewController.h
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *topbar;


- (IBAction)openDrawer:(id)sender;
- (IBAction)topBarTitleClicked:(id)sender;

- (IBAction)mathcesClicked:(id)sender;

@end

