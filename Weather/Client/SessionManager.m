//
//  SessionManager.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//


#import "SessionManager.h"
#import "AFHTTPSessionManager.h"
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

typedef void (^ParserCompletionBlock)(id modelObject);

@implementation SessionManager

- (NSURLSessionDataTask *)GET:(NSString *)url parameters:(id)parameters modelClass:(Class)modeClass completion:(DataTaskCompletionBlock)block {
    NSURLSessionDataTask *dataTask = [self.manager GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id jsonObject) {
        [self responseObjectWithJsonObject:jsonObject modelClass:modeClass withCompletion:^(id modelObject) {
            block(task, modelObject, nil);
        }];
    }                                          failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self handleFailureWithTask:task error:error completion:block];

    }];
    return dataTask;
}

- (void)cancelAllTasks {
    for (NSURLSessionDataTask *task in  self.manager.tasks) {
        [task cancel];
    }
}


- (void)handleFailureWithTask:(NSURLSessionDataTask *)task error:(NSError *)error completion:(DataTaskCompletionBlock)completion {
    id jsonObject = [self jsonObjectForResponse:task.response error:error];
    completion(task, jsonObject, error);
}

- (id)jsonObjectForResponse:(NSURLResponse *)response error:(NSError *)serverError {

    NSData *data = serverError.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];

    NSError *parseError = nil;

    id responseObject = [self.manager.responseSerializer responseObjectForResponse:response data:data error:&parseError];

    if (parseError) {
        NSLog(@"Json serialization error %@", parseError);
        return nil;
    }

    return responseObject;
}

- (void)responseObjectWithJsonObject:(id)jsonObject modelClass:(Class)modelClass withCompletion:(ParserCompletionBlock)completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {

        id modelObject = nil;

        if (!modelClass) {
            modelObject = jsonObject;
        } else {
            NSError *parseError = nil;

            if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                modelObject = [MTLJSONAdapter modelOfClass:modelClass fromJSONDictionary:jsonObject error:&parseError];
            } else if ([jsonObject isKindOfClass:[NSArray class]]) {
                modelObject = [MTLJSONAdapter modelsOfClass:modelClass fromJSONArray:jsonObject error:&parseError];
            }

            if (parseError)
                NSLog(@"Model serialization error %@", parseError);
        }

        dispatch_async(dispatch_get_main_queue(), ^(void) {
            completion(modelObject);
        });
    });
};

@end