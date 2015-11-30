//
//  CityTableViewController.h
//  Weather
//
//  Created by Alexander Sivura on 29/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CitiesDao;
@protocol WeatherClient;

@interface CityTableViewController : UITableViewController

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) id<CitiesDao> citiesDao;
@property (nonatomic, strong) id<WeatherClient> weatherClient;

@end
