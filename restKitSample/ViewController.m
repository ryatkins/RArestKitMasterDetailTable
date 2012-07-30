//
//  ViewController.m
//  restKitSample
//
//  Created by Ryan Atkins on 7/19/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "Category.h"
#import <RestKit/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize categories = _categories;
@synthesize detailTableViewController = _detailTableViewController;

- (void)dealloc {
    [_categories release];
    [super dealloc];
}

- (void) reloadTable
{
     NSLog(@"reload");
    [self loadContact];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *reloadButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadTable)] autorelease]; 
    self.navigationItem.rightBarButtonItem = reloadButton;
    
    NSLog(@"viewDidLoad viewController");
    
    
      
    [self loadContact];  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark RestKit

- (void)loadContact {
    
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    [objectManager loadObjectsAtResourcePath:@"json.php" delegate:self];
    
}

// RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    
    self.categories = [objects retain];
    
    
     Category* category = ((Category*)[_categories objectAtIndex:0]);
     NSArray* models = [category.models allObjects];

     for (Model* model in models) {
         NSLog(@"model.id | model.title: %@ | %@", model.modelID, model.title);
     }
     NSLog(@"done");


    Category* category2 = ((Category*)[_categories objectAtIndex:1]);
    NSArray* models2 = [category2.models allObjects];
    
    for (Model* model2 in models2) {
        NSLog(@"model.id | model.title: %@ | %@", model2.modelID, model2.title);
    }
    NSLog(@"done");

    
    
    [self loadObjectsFromDataStore];   
    
}
    
- (void) loadObjectsFromDataStore {
    NSFetchRequest* fetchRequest = [Category fetchRequest];
    self.categories = [[Category objectsWithFetchRequest:fetchRequest] retain] ;
    
    [self.tableView reloadData];

}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}


- (void)reloadButtonWasPressed { //:(id)sender {
    // Load the object model via RestKit
//    [self loadData];

    [self.tableView reloadData];

}


#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* reuseIdentifier = @"Tweet Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        //cell.textLabel.numberOfLines = 0;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"listbg.png"]];
    }
    
    Category* category = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = category.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (!self.detailTableViewController) {
        self.detailTableViewController = [[[DetailTableViewController alloc] initWithNibName:@"DetailTableViewController" bundle:nil] autorelease];
    }
    
    Category* category = [self.categories objectAtIndex:indexPath.row];
    self.detailTableViewController.category = category;
    self.detailTableViewController.title = NSLocalizedString(category.title, category.title);

    [self.navigationController pushViewController:self.detailTableViewController animated:YES];

    [self.detailTableViewController.tableView reloadData];
    
    
    [category release];    
}


@end
