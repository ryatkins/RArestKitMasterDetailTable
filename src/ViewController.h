//
//  ViewController.h
//  restKitSample
//
//  Created by Ryan Atkins on 7/19/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "DetailTableViewController.h"

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, RKObjectLoaderDelegate>
{

    NSArray* _models;
    NSArray* categories;
    
//    IBOutlet UIButton *reloadTableView;
    
}

@property (nonatomic, retain) NSArray* categories;
@property (strong, nonatomic) DetailTableViewController *detailTableViewController;

- (void)reloadButtonWasPressed;

@end
