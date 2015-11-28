//
//  WeatherClientImpl.h
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherClient.h"

@interface WeatherClientImpl : NSObject<WeatherClient>

@property(nonatomic, strong) SessionManager *sessionManager;

@end
