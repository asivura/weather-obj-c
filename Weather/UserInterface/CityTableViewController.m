//
//  CityTableViewController.m
//  Weather
//
//  Created by Alexander Sivura on 29/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "CityTableViewController.h"
#import "FetchedObjectController.h"
#import "CitiesDao.h"
#import "WeatherClient.h"
#import "City.h"
#import "Weather.h"
#import "Main.h"
#import "Wind.h"
#import "Sys.h"

@interface CityTableViewController () <FetchedObjectControllerDelegate>

@property(nonatomic, strong) FetchedObjectController *fetchedObjectController;
@property(weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property(weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property(weak, nonatomic) IBOutlet UILabel *windLabel;
@property(weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property(weak, nonatomic) IBOutlet UILabel *humidityLabel;

@end

@implementation CityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.refreshControl addTarget:self action:@selector(reloadCity) forControlEvents:UIControlEventValueChanged];
    [self reloadCity];

    self.fetchedObjectController = [self.citiesDao fetchedObjectControllerWithKey:self.key];
    self.fetchedObjectController.delegate = self;
    [self updateViews];
}

- (void)reloadCity {
    [self.weatherClient loadWeatherForCityId:self.key completion:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
        if (!error) {
            [self.citiesDao save:responseObject completion:^{
                NSLog(@"City loaded");
                [self.refreshControl endRefreshing];
            }];
        } else {
            NSLog(@"Load city error %@", error);
            [self.refreshControl endRefreshing];
        }
    }];
}

- (void)updateViews {
    City *city = [self.fetchedObjectController object];
    Weather *weather = city.weather.lastObject;
    self.title = [NSString stringWithFormat:@"%@, %@", city.name, city.sys.country];
    self.timeLabel.text = [NSDateFormatter localizedStringFromDate:city.dt
                                                         dateStyle:NSDateFormatterShortStyle
                                                         timeStyle:NSDateFormatterShortStyle];
    self.weatherLabel.text = weather.descr;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@ ℃", city.main.temp.stringValue];
    self.windLabel.text = [NSString stringWithFormat:@"%@ mps", city.wind.speed.stringValue];
    self.pressureLabel.text = [NSString stringWithFormat:@"%@ hPa", city.main.pressure.stringValue];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@ %%", city.main.humidity.stringValue];
}

- (void)controllerDidChangeContent:(FetchedObjectController *)controller {
    [self updateViews];
}


@end
