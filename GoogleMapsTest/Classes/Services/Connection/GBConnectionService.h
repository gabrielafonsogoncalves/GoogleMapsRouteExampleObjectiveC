//
//  GBConnectionService.h
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GBConnectionServiceDelegate <NSObject>

- (void)gotResponseObject:(id)response;

@end

@interface GBConnectionService : NSObject

- (void)GETRequestWithURL:(NSString *)url delegate:(id<GBConnectionServiceDelegate>)delegate;

@end
