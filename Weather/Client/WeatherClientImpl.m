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
    [self.sessionManager GET:@"weather" parameters:@{@"id":cityId, @"units":@"metric"} modelClass:[City class] completion:completion];
}

-(void)loadWeatherForCityIds:(NSArray *)cityIds completion:(DataTaskCompletionBlock)completion {
    NSString *idParam = [cityIds componentsJoinedByString:@","];
    [self.sessionManager GET:@"group" parameters:@{@"id":idParam, @"units":@"metric"} modelClass:[City class] completion:completion];
}

- (void)findCitiesForQuery:(NSString *)query completion:(DataTaskCompletionBlock)completion {
    [self.sessionManager GET:@"find" parameters:@{@"q":query, @"units":@"metric", @"type":@"like"} modelClass:[City class] completion:completion];
}


@end
