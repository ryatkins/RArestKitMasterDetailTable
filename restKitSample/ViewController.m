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

@synthesize _categories;

- (void)dealloc {
    [_tableView release];
    [_categories release];
   
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
      
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
    [self loadObjectsFromDataStore];   
    
}
    
- (void) loadObjectsFromDataStore {
    NSFetchRequest* fetchRequest = [Category fetchRequest];
    //sort etc
    _categories = [[Category objectsWithFetchRequest:fetchRequest] retain] ;

    
//    Category* category = ((Category*)[_categories objectAtIndex:0]);
//    NSArray* models = [category.models allObjects];
    
//    for (Model* model in models) {
//        NSLog(@"model.id | model.title: %@ | %@", model.modelID, model.title);
//    }
//    NSLog(@"done");
    
    [_tableView reloadData];

}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}


- (void)reloadButtonWasPressed { //:(id)sender {
    // Load the object model via RestKit
//    [self loadData];

 [_tableView reloadData];

}


#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    return [_categories count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDate* lastUpdatedAt = [[NSUserDefaults standardUserDefaults] objectForKey:@"LastUpdatedAt"];
    NSString* dateString = [NSDateFormatter localizedStringFromDate:lastUpdatedAt dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterMediumStyle];
    if (nil == dateString) {
        dateString = @"Never";
    }
    return [NSString stringWithFormat:@"Last Load: %@", dateString];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* reuseIdentifier = @"Tweet Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        //cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"listbg.png"]];
    }
    
    Category* category = [_categories objectAtIndex:indexPath.row];
    cell.textLabel.text = category.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}









@end
