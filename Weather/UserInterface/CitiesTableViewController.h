//
//  CitiesTableViewController.h
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeatherClient;
@protocol CitiesDao;
@class DatabaseManager;

@interface CitiesTableViewController : UITableViewController

@property (nonatomic, strong) id<WeatherClient> weatherClient;
@property (nonatomic, strong) id<CitiesDao> citiesDao;
@property (nonatomic, strong) DatabaseManager *dbManager;



@end
