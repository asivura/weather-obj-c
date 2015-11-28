//
//  CitiesTableViewController.h
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeatherClient;

@interface CitiesTableViewController : UITableViewController

@property (nonatomic, strong) id<WeatherClient> weatherClient;

@end
