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
#import "Weather.h"
#import <YapDatabase/YapDatabase.h>

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

    [self reloadCities];
}

- (void)reloadCities {
    [self.citiesDao getAllKeysWithCompletion:^(NSArray *keys) {
        [self.weatherClient loadWeatherForCityIds:keys completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
            if (!error) {
                [self.citiesDao saveAll:responseObject completion:^{
                    NSLog(@"Cities loaded");
                }];
            } else {
                NSLog(@"Cities load error %@", error);
            }
        }];
    }];

}

- (YapDatabaseViewMappings *)mappings {
    if (!_mappings) {
        _mappings = [[YapDatabaseViewMappings alloc] initWithGroups:@[@""] view:dbCitiesView];
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
    Weather *weather = city.weather.lastObject;
    cell.detailTextLabel.text = weather.descr;
    return cell;
}


@end
