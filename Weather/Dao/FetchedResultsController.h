//
// Created by Alexander Sivura on 28/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class YapDatabaseConnection;
@class YapDatabaseViewMappings;
@protocol FetchedResultsControllerDelegate;


@interface FetchedResultsController : NSObject

@property (nonatomic, weak) id<FetchedResultsControllerDelegate> delegate;

- (id) initWithConnection:(YapDatabaseConnection *)connection mappings:(YapDatabaseViewMappings *)mappings;
- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfItemsInSection:(NSUInteger)section;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

//Boilerplate code for updating table view with section and row changes
+ (void)updateTableView:(UITableView *)tableView sectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges;


@end

@protocol FetchedResultsControllerDelegate <NSObject>

- (void)controllerDidChangeContent:(FetchedResultsController *)controller sectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges;


@end
