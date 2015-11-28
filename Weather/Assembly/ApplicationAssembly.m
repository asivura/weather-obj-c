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

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
            }];
}

- (CitiesTableViewController *)citiesTableViewController {
    return [TyphoonDefinition withClass:[CitiesTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(weatherClient) with:[_coreComponents weatherClient]];

    }];
}

@end
