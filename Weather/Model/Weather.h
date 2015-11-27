//
//  Weather.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Weather : MTLModel<MTLJSONSerializing>

@property(nonatomic, copy) NSNumber *id;
@property(nonatomic, copy) NSString *main;
@property(nonatomic, copy) NSString *descr;
@property(nonatomic, copy) NSString *icon;


@end
