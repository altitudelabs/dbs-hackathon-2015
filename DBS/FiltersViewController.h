//
//  FiltersViewController.h
//  DBS
//
//  Created by Altitude Labs on 5/3/15.
//  Copyright (c) 2015 DBS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *bgView;

- (IBAction)saveClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end
