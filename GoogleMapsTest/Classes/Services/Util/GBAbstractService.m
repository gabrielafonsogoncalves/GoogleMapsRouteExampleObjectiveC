//
//  GBAbstractService.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBAbstractService.h"

@implementation GBAbstractService

- (id)init
{
    self = [super init];
    if (self) {
        self.builder = [[GBBuilder alloc] init];
    }
    
    return self;
}

@end
