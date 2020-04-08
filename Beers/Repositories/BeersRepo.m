//
//  Beers.m
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "BeersRepo.h"

@implementation BeersRepo

+ (void)fetchList:(int)page itemsPerPage:(int)per_page sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSError * _Nonnull))errorHandler{
    
     NSDictionary *params = @{ @"page":[NSString stringWithFormat:@"%d", page], @"per_page":[NSString stringWithFormat:@"%d", per_page]};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.punkapi.com/v2/beers" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject){
        successHandler(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error){
        errorHandler ?: errorHandler(error);
    }];
    
}


+ (void)fetchBeer:(int)beerId sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSError * _Nonnull))errorHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:@"https://api.punkapi.com/v2/beers/%d",beerId] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject){
        successHandler(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error){
        NSLog(@"Error: %@", error);
    }];
}





@end
