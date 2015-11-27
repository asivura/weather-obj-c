//
//  ApplicationAssembly.m
//  Weather
//
//  Created by Alexander Sivura on 26/11/15.
//  Copyright © 2015 Alexander Sivura. All rights reserved.
//

#import "ApplicationAssembly.h"

@implementation ApplicationAssembly

//-------------------------------------------------------------------------------------------
#pragma mark - Bootstrapping
//-------------------------------------------------------------------------------------------

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
            }];
}


- (id)configurer
{
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}

@end
