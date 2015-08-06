//
//  GBPolylineBuilder.h
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/31/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBObjectBuilder.h"

@interface GBPolylineBuilder : NSObject <GBObjectBuilder>

@property (nonatomic, strong) GBBuilder *context;

@end
