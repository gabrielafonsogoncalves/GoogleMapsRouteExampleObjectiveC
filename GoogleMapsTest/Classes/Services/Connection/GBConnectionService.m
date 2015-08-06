//
//  GBConnectionService.m
//  GoogleMapsTest
//
//  Created by Gabriel Alejandro Afonso Goncalves on 7/30/15.
//  Copyright (c) 2015 Gabriel Alejandro Afonso Goncalves. All rights reserved.
//

#import "GBConnectionService.h"
#import <AFNetworking/AFNetworking.h>

@interface GBConnectionService()

@end

@implementation GBConnectionService

- (void)GETRequestWithURL:(NSString *)url delegate:(id<GBConnectionServiceDelegate>)delegate
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [delegate gotResponseObject:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //ToDo: Do something if an error happend
        NSLog(@"Error: %@", error);
    }];
}

@end
