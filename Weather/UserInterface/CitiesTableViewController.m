//
//  CitiesTableViewController.m
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "CitiesTableViewController.h"
#import "WeatherClient.h"
#import "CitiesDao.h"
#import "DatabaseManager.h"
#import "YapDatabase/YapDatabaseViewTransaction.h"
#import "City.h"
#import <YapDatabase/YapDatabase.h>
#import <YapDatabase/YapDatabaseViewMappings.h>

@interface CitiesTableViewController ()

@property(strong, nonatomic) YapDatabaseConnection *connection;
@property(strong, nonatomic) YapDatabaseViewMappings *mappings;

@end

@implementation CitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.connection beginLongLivedReadTransaction];
    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {

        [self.mappings updateWithTransaction:transaction];
    }];
//    [self.weatherClient loadWeatherForCityId:@"5391997" completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        NSLog(@"Response: %@. Error %@", responseObject, error);
//
//    }];
//
//    [self.weatherClient loadWeatherForCityIds:@[@"5391997", @"5601538"] completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        NSLog(@"Response: %@. Error %@", responseObject, error);
//    }];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (YapDatabaseViewMappings *)mappings {
    if (!_mappings) {
        _mappings = [[YapDatabaseViewMappings alloc] initWithGroups:@[@"all"] view:dbCitiesView];
    }
    return _mappings;
}


- (YapDatabaseConnection *)connection {
    if (!_connection) {
        _connection = [self.dbManager.db newConnection];
    }
    return _connection;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)sender {
    return [self.mappings numberOfSections];
}

- (NSInteger)tableView:(UITableView *)sender numberOfRowsInSection:(NSInteger)section {
    return [self.mappings numberOfItemsInSection:(NSUInteger) section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    __block City *city = nil;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
        YapDatabaseViewTransaction *extensionTransaction = (YapDatabaseViewTransaction *) [transaction extension:dbCitiesView];
        city = [extensionTransaction objectAtIndexPath:indexPath withMappings:self.mappings];
    }];
    cell.textLabel.text = city.name;
    return cell;
}


@end
