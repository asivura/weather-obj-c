//
// Created by Alexander Sivura on 28/11/15.
// Copyright (c) 2015 Alexander Sivura. All rights reserved.
//

#import "FetchedResultsController.h"
#import "DatabaseManager.h"
#import <YapDatabase/YapDatabaseTransaction.h>
#import <YapDatabase/YapDatabase.h>
#import <YapDatabaseViewConnection.h>
#import <YapDatabase/YapDatabaseViewTransaction.h>


@interface FetchedResultsController ()

@property(nonatomic, strong) YapDatabaseViewMappings *mappings;
@property(nonatomic, strong) YapDatabaseConnection *connection;

@end

@implementation FetchedResultsController

- (id)initWithConnection:(YapDatabaseConnection *)connection mappings:(YapDatabaseViewMappings *)mappings {
    self = [super init];
    if (self) {
        self.mappings = mappings;
        self.connection = connection;

        [self.connection beginLongLivedReadTransaction];

        [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
            [self.mappings updateWithTransaction:transaction];
        }];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(yapDatabaseModified:)
                                                     name:YapDatabaseModifiedNotification
                                                   object:self.connection.database];
    }
    return self;
}

- (void)yapDatabaseModified:(NSNotification *)notification {

    NSArray *notifications = [self.connection beginLongLivedReadTransaction];

    NSArray *sectionChanges = nil;
    NSArray *rowChanges = nil;
    YapDatabaseViewConnection *viewConnection = (YapDatabaseViewConnection *) [self.connection ext:dbCitiesView];
    [viewConnection getSectionChanges:&sectionChanges
                           rowChanges:&rowChanges
                     forNotifications:notifications
                         withMappings:self.mappings];

    if ([sectionChanges count] == 0 & [rowChanges count] == 0) {
        return;
    }

    [self.delegate controllerDidChangeContent:self sectionChanges:sectionChanges rowChanges:rowChanges];
}

- (NSUInteger)numberOfSections {
    return [self.mappings numberOfSections];
}

- (NSUInteger)numberOfItemsInSection:(NSUInteger)section {
    return [self.mappings numberOfItemsInSection:section];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath {
    __block id result = nil;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        YapDatabaseViewTransaction *extensionTransaction = (YapDatabaseViewTransaction *) [transaction extension:dbCitiesView];
        result = [extensionTransaction objectAtIndexPath:indexPath withMappings:self.mappings];
    }];
    return result;
}

//Boilerplate code for updating table view with section and row changes
+ (void)updateTableView:(UITableView *)tableView sectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges {
    for (YapDatabaseViewSectionChange *sectionChange in sectionChanges)
    {
        switch (sectionChange.type)
        {
            case YapDatabaseViewChangeDelete :
            {
                [tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionChange.index]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeInsert :
            {
                [tableView insertSections:[NSIndexSet indexSetWithIndex:sectionChange.index]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
        }
    }

    for (YapDatabaseViewRowChange *rowChange in rowChanges)
    {
        switch (rowChange.type)
        {
            case YapDatabaseViewChangeDelete :
            {
                [tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeInsert :
            {
                [tableView insertRowsAtIndexPaths:@[ rowChange.newIndexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeMove :
            {
                [tableView deleteRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                [tableView insertRowsAtIndexPaths:@[ rowChange.newIndexPath ]
                                      withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            case YapDatabaseViewChangeUpdate :
            {
                [tableView reloadRowsAtIndexPaths:@[ rowChange.indexPath ]
                                      withRowAnimation:UITableViewRowAnimationNone];
                break;
            }
        }
    }

}


@end