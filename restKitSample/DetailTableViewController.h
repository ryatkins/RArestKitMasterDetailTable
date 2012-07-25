//
//  DetailTableViewController.h
//  restKitSample
//
//  Created by Ryan Atkins on 7/25/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"
#import "Model.h"

@interface DetailTableViewController : UITableViewController


@property (strong, nonatomic) Category* category;

@end
