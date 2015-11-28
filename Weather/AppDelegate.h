//
//  AppDelegate.h
//  Weather
//
//  Created by Alexander Sivura on 25/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CitiesDao;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id<CitiesDao> citiesDao;

@end

