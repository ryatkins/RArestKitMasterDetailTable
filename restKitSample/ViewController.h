//
//  ViewController.h
//  restKitSample
//
//  Created by Ryan Atkins on 7/19/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKObjectLoaderDelegate>
{
    
    UITableView *_tableView;
    NSArray* _models;
    NSArray* _categories;
    
//    IBOutlet UIButton *reloadTableView;
    
}

@property (nonatomic, retain) NSArray* _categories;

- (void)reloadButtonWasPressed;

@end
