//
//  AppDelegate.m
//  Weather
//
//  Created by Alexander Sivura on 25/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "AppDelegate.h"
#import "CitiesDao.h"
#import "City.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self addDefaultCities];
    }

    return YES;
}

- (void)addDefaultCities {
    NSArray *cities = @[
            [[City alloc] initWithId:@5391959 name:@"San Francisco"],
            [[City alloc] initWithId:@524901 name:@"Moscow"],
            [[City alloc] initWithId:@5128581 name:@"New York"]
    ];

    [self.citiesDao saveAll:cities completion:^{
        NSLog(@"Default cities added");
    }];
}

@end
