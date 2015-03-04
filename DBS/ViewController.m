//
//  ViewController.m
//  DBS
//
//  Created by Altitude Labs on 4/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import "ViewController.h"
<<<<<<< HEAD
#import "DraggableViewBackground.h"
=======
#import "DataManager.h"
>>>>>>> 00fd4922ba9f3854cd05d7e87e5463ca10b85871

@interface ViewController ()


@property (assign, nonatomic) BOOL drawerOpened;
@end

@implementation ViewController
@synthesize mainView;
@synthesize drawerOpened;

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:CGRectMake(0, 0, self.mainView.frame.size.width, self.mainView.frame.size.height)];
    [self.mainView addSubview:draggableBackground];
    
    // Drawer setup
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *drawerVC = [storyboard instantiateViewControllerWithIdentifier:@"Drawer"];
    [self addChildViewController:drawerVC];
    [self.view insertSubview:drawerVC.view belowSubview:self.mainView];
    self.drawerOpened = NO;
=======
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *person1 = [[DataManager sharedInstance] getNextCard];
    [[DataManager sharedInstance] swipeRight: person1];
    
    [[DataManager sharedInstance] filterCardStackWithRoom:kFundraising positions:nil];

    NSMutableDictionary *person2 = [[DataManager sharedInstance] getNextCard];
    [[DataManager sharedInstance] swipeRight: person2];
    
    [[DataManager sharedInstance] getMatches];
>>>>>>> 00fd4922ba9f3854cd05d7e87e5463ca10b85871
    
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
    } completion:^(BOOL finished) {
        drawerOpened = !drawerOpened;
    }];
}
@end
