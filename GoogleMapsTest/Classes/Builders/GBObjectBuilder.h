//
//  GBObjectBuilder.h
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBBuilder.h"

@protocol GBObjectBuilder <NSObject>

@property (nonatomic, strong) GBBuilder *context;

- (id)buildFromDictionary:(NSDictionary *)dictionary;

@end
