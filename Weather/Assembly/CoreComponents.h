//
//  CoreComponents.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol WeatherClient;
@class SessionManager;

@interface CoreComponents : TyphoonAssembly

- (id<WeatherClient>) weatherClient;

- (SessionManager *) sessionManager;

@end
