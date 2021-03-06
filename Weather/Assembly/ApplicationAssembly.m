//
//  ApplicationAssembly.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "CitiesTableViewController.h"
#import "CoreComponents.h"
#import "CityTableViewController.h"
#import "CitiesSearchTableViewController.h"

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(citiesDao) with:[_coreComponents citiesDao]];
            }];
}

- (CitiesTableViewController *)citiesTableViewController {
    return [TyphoonDefinition withClass:[CitiesTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherClient) with:[_coreComponents weatherClient]];
        [definition injectProperty:@selector(citiesDao) with:[_coreComponents citiesDao]];
        [definition injectProperty:@selector(dbManager) with:[_coreComponents dbManager]];
    }];
}

- (CityTableViewController *)cityTableViewController {
    return [TyphoonDefinition withClass:[CityTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(citiesDao) with:[_coreComponents citiesDao]];
        [definition injectProperty:@selector(weatherClient) with:[_coreComponents weatherClient]];
    }];
}

- (CitiesSearchTableViewController *)citiesSearchTableViewController {

    return [TyphoonDefinition withClass:[CitiesSearchTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(citiesDao) with:[_coreComponents citiesDao]];
        [definition injectProperty:@selector(weatherClient) with:[_coreComponents weatherClient]];
    }];
}


@end
