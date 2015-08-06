//
//  GBTrip.h
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBPolyline.h"

@interface GBTrip : NSObject

@property (nonatomic, strong) GBPolyline *polyline;
@property (nonatomic, strong) NSString *summary;

@end
