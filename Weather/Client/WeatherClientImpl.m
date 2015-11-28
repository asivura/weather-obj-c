//
//  WeatherClientImpl.m
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "WeatherClientImpl.h"
#import "City.h"

@implementation WeatherClientImpl

-(void)loadWeatherForCityId:(NSString *)cityId completion:(DataTaskCompletionBlock)completion {
    [self.sessionManager GET:@"weather" parameters:@{@"id":cityId} modelClass:[City class] completion:completion];
}

@end
