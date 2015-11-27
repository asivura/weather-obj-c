//
//  Rain.h
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

@interface Rain : MTLModel<MTLJSONSerializing>

@property(nonatomic, copy) NSNumber *volume3h;

@end
