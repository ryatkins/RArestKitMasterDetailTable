//
//  AppDelegate.m
//  restKitSample
//
//  Created by Ryan Atkins on 7/19/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>
#import "Model.h"
#import "Category.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (void)restKitSetup
{
    
//    RKLogInitialize();
//    RKLogConfigureFromEnvironment();

    
    RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURLString:@"http://ionreality.com/"];

    // Core Data store
    RKManagedObjectStore* objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"RKData.sqlite"];
    objectManager.objectStore = objectStore; 
    
    // Activity indicator
    objectManager.client.requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;
    
    // MAPPING - Model
    RKManagedObjectMapping *modelMapping = [RKManagedObjectMapping mappingForClass:[Model class] inManagedObjectStore:objectManager.objectStore];
    modelMapping.primaryKeyAttribute = @"modelID"; 
    [modelMapping mapKeyPath:@"id" toAttribute:@"modelID"];
    [modelMapping mapKeyPath:@"title" toAttribute:@"title"];
    [modelMapping mapKeyPath:@"image" toAttribute:@"image"];
   // [modelMapping mapKeyPath:@"assigned_category_id" toAttribute:@"assignedCategoryID"];    
//    [objectManager.mappingProvider setMapping:modelMapping forKeyPath:@"models"];

    
    // MAPPING - Category
    RKManagedObjectMapping *categoryMapping = [RKManagedObjectMapping mappingForClass:[Category class] inManagedObjectStore:objectManager.objectStore];
    categoryMapping.primaryKeyAttribute = @"categoryID";  
    [categoryMapping mapKeyPath:@"id" toAttribute:@"categoryID"];
    [categoryMapping mapKeyPath:@"title" toAttribute:@"title"];
    [categoryMapping mapKeyPath:@"image" toAttribute:@"image"];
    [categoryMapping mapRelationship:@"models" withMapping:modelMapping];
    [objectManager.mappingProvider setMapping:categoryMapping forKeyPath:@"category"];
    
    // Hydrate the assignedCategory association via primary key
//    [modelMapping hasOne:@"assignedCategory" withMapping:categoryMapping];
//    [modelMapping connectRelationship:@"assignedCategory" withObjectForPrimaryKeyAttribute:@"assignedCategoryID"];
////    

    
    

  // [objectManager.mappingProvider setObjectMapping:categoryMapping forResourcePathPattern:@"json.php"];


    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    

    [self restKitSetup];
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
