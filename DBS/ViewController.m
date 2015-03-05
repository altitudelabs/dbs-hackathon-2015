//
//  ViewController.m
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "ViewController.h"
#import "DraggableViewBackground.h"

@interface ViewController ()


@property (assign, nonatomic) BOOL drawerOpened;
@property (strong, nonatomic) DraggableViewBackground *draggableBackground;
@end

@implementation ViewController
@synthesize mainView;
@synthesize drawerOpened;
@synthesize draggableBackground;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Navigation bar
    UINavigationController* nc = (UINavigationController*)[[[UIApplication sharedApplication] delegate] window].rootViewController;
//    [nc.navigationBar setBarTintColor:[UIColor colorWithRed:206.0/255.0 green:36.0/255.0 blue:43.0/255.0 alpha:1]];
//    nc.navigationBar.translucent = NO;
    [nc setNavigationBarHidden:YES animated:YES];
    
    
    draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(0, 0, self.mainView.frame.size.width, self.mainView.frame.size.height)];
    [self.mainView addSubview:draggableBackground];
    
    // Drawer setup
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *drawerVC = [storyboard instantiateViewControllerWithIdentifier:@"Drawer"];
    [self addChildViewController:drawerVC];
    [self.view insertSubview:drawerVC.view belowSubview:self.mainView];
    self.drawerOpened = NO;
    
    // UI
    self.btnLater.layer.borderWidth = 1;
    self.btnLater.layer.borderColor = [UIColor colorWithRed:184.0/255.0 green:184.0/255.0 blue:184.0/255.0 alpha:1].CGColor;
}

- (IBAction)openDrawer:(id)sender {
    // Add or remove shadow
    if (!self.drawerOpened) {
        self.mainView.layer.shadowRadius = 3;
        self.mainView.layer.shadowOpacity = 0.9;
        self.mainView.layer.shadowOffset = CGSizeMake(1, 1);
    } else {
        self.mainView.layer.shadowRadius = 0;
        self.mainView.layer.shadowOpacity = 0.0;
        self.mainView.layer.shadowOffset = CGSizeMake(0, 0);
    }
    
    // Slide
    [UIView animateWithDuration:0.3f animations:^{
        self.mainView.frame = CGRectMake(self.drawerOpened? 0 : 200,
                                        0, self.view.frame.size.width, self.view.frame.size.height);
        self.topbar.frame = CGRectMake(self.drawerOpened? 0 : 200,
                                         0, self.topbar.frame.size.width, self.topbar.frame.size.height);
        
        self.btnConnect.frame = CGRectMake(self.drawerOpened?
                                           self.btnConnect.frame.origin.x - 200 :
                                           self.btnConnect.frame.origin.x + 200,
                                           self.btnConnect.frame.origin.y,
                                           self.btnConnect.frame.size.width,
                                           self.btnConnect.frame.size.height);
        
        self.btnLater.frame = CGRectMake(self.drawerOpened?
                                           self.btnLater.frame.origin.x - 200 :
                                           self.btnLater.frame.origin.x + 200,
                                           self.btnLater.frame.origin.y,
                                           self.btnLater.frame.size.width,
                                           self.btnLater.frame.size.height);
        
    } completion:^(BOOL finished) {
        drawerOpened = !drawerOpened;
    }];
}

- (IBAction)topBarTitleClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *filtersVC = [storyboard instantiateViewControllerWithIdentifier:@"FiltersViewController"];
    [self.navigationController pushViewController:filtersVC animated:YES];
}

- (IBAction)mathcesClicked:(id)sender {
    
}

- (IBAction)btnLaterClicked:(id)sender {
    [draggableBackground swipeLeft];
}

- (IBAction)btnConnectClick:(id)sender {
    [draggableBackground swipeRight];
}
@end
