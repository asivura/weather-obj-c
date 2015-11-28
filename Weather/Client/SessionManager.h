//
//  SessionManager.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

typedef void(^DataTaskCompletionBlock)(NSURLSessionDataTask * task, id responseObject, NSError *error);

@interface SessionManager : NSObject

@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (strong, nonatomic) NSString *apiKey;

- (void)GET:(NSString *)url parameters:(NSDictionary *)parameters modelClass:(Class)modeClass completion:(DataTaskCompletionBlock)block;

-(void) cancelAllTasks;

@end
