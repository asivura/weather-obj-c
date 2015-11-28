//
//  WeatherClient.h
//  Weather
//
//  Created by Alexander Sivura on 27/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionManager.h"


@protocol WeatherClient <NSObject>

- (void)loadWeatherForCityId:(NSString *) cityId completion:(DataTaskCompletionBlock)completion;

@end

