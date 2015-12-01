//
//  CitiesSearchTableViewController.m
//  Weather
//
//  Created by Alexander Sivura on 30/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "CitiesSearchTableViewController.h"
#import "City.h"
#import "Sys.h"
#import "CitySearchResultTableViewCell.h"

@interface CitiesSearchTableViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property(strong, nonatomic) NSArray *cities;

@end

@implementation CitiesSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    [self.searchBar becomeFirstResponder];
    self.cities = @[];
    
}

- (void) searchCities {
    self.cities = @[];
    [self.tableView reloadData];
    NSString *query = self.searchBar.text;
    if (!query || query.length < 3) {
        return;
    }
    [self.weatherClient findCitiesForQuery:query completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (!error) {
            self.cities = responseObject;
            [self.tableView reloadData];
        } else {
            NSLog(@"Find cities error %@", error);
        }
    }];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchCities];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CitySearchResultTableViewCell *cell = (CitySearchResultTableViewCell *) [self.tableView
            dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    City *city = self.cities[(NSUInteger) indexPath.row];
    cell.titleLabel.text =  [NSString stringWithFormat:@"%@, %@", city.name, city.sys.country];
    cell.addButton.enabled = NO;
    return cell;
}


@end
