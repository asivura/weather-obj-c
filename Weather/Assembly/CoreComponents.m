//
//  CoreComponents.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <AFNetworking/AFURLRequestSerialization.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "CoreComponents.h"
#import "WeatherClient.h"
#import "CitiesDao.h"
#import "DatabaseManager.h"
#import "WeatherClientImpl.h"
#import "CitiesDaoImpl.h"

@implementation CoreComponents

- (id <WeatherClient>)weatherClient {
    return [TyphoonDefinition withClass:[WeatherClientImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(sessionManager) with:[self sessionManager]];
    }];
}

- (id <CitiesDao>)citiesDao {
    return [TyphoonDefinition withClass:[CitiesDaoImpl class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(dbManager) with:[self dbManager]];
    }];
}

- (AFHTTPSessionManager *)afSessionManager {
    return [TyphoonDefinition withClass:[AFHTTPSessionManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseURL:sessionConfiguration:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"service.url")];
            NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            [initializer injectParameterWith:sessionConfiguration];
        }];

        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];

        [definition injectProperty:@selector(requestSerializer) with:requestSerializer];


        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];

        [definition injectProperty:@selector(responseSerializer) with:responseSerializer];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (SessionManager *)sessionManager {
    return [TyphoonDefinition withClass:[SessionManager class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(manager) with:[self afSessionManager]];
        [definition injectProperty:@selector(apiKey) with:TyphoonConfig(@"api.key")];
    }];
}

- (DatabaseManager *)dbManager {
    return [TyphoonDefinition withClass:[DatabaseManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithDbName:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TyphoonConfig(@"db.filename")];
        }];
        definition.scope = TyphoonScopeSingleton;

    }];
}


@end
