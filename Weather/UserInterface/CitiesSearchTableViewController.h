//
//  CitiesSearchTableViewController.h
//  Weather
//
//  Created by Alexander Sivura on 30/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CitiesDao.h"
#import "WeatherClient.h"

@interface CitiesSearchTableViewController : UITableViewController

@property(strong, nonatomic) id<CitiesDao> citiesDao;

@property(strong, nonatomic) id<WeatherClient> weatherClient;

@end
