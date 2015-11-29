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
#import "City.h"
#import "Weather.h"
#import "FetchedResultsController.h"

@interface CitiesTableViewController () <FetchedResultsControllerDelegate>

@property(strong, nonatomic) FetchedResultsController *fetchedResultsController;

@end

@implementation CitiesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.fetchedResultsController = [self.citiesDao fetchedResultsController];
    self.fetchedResultsController.delegate = self;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)sender {
    return [self.fetchedResultsController numberOfSections];
}

- (NSInteger)tableView:(UITableView *)sender numberOfRowsInSection:(NSInteger)section {
    return [self.fetchedResultsController numberOfItemsInSection:(NSUInteger) section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    City *city = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = city.name;
    Weather *weather = city.weather.lastObject;
    cell.detailTextLabel.text = weather.descr;
    return cell;
}

- (void)controllerDidChangeContent:(FetchedResultsController *)controller sectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges {
    [self.tableView beginUpdates];
    [FetchedResultsController updateTableView:self.tableView sectionChanges:sectionChanges rowChanges:rowChanges];
    [self.tableView endUpdates];
}


@end
