//
//  Category.h
//  
//
//  Created by Ryan Atkins on 7/20/12.
//  Copyright (c) 2012 Ryan Atkins. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <RestKit/CoreData.h>


@interface Category : NSManagedObject


@property (nonatomic, retain) NSNumber* categoryID;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* image;
@property (nonatomic, retain) NSSet* models;

@end
