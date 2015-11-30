//
//  ApplicationAssembly.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "AppDelegate.h"

@class CitiesTableViewController;
@class CoreComponents;
@class CityTableViewController;

@interface ApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) CoreComponents *coreComponents;

- (AppDelegate *)appDelegate;

- (CitiesTableViewController *) citiesTableViewController;

- (CityTableViewController *) cityTableViewController;

@end
