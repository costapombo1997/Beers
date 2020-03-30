//
//  BeersViewModel.m
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "BeersViewModel.h"

@implementation BeersViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isLoading = YES;
        //defaults
        self.currentPage = 1;
        self.itemsPerPage = 10;
        self.beers = [NSMutableArray new];
    }
    return self;
}



// values just for demo
- (void)fetchList:(int)page itemsPerPage:(int)per_page sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSDictionary * _Nonnull))errorHandler{
    
    NSLog(@"Fetching");
    
    [BeersRepo fetchList:page itemsPerPage:per_page sucessHandler:^(NSArray * data){
        // probably using setters to trigger events ?!
        
        for (NSDictionary *rawBeer in data) {
            BeerModel *beer = [BeerModel new];
            beer.name = [rawBeer objectForKey:@"name"];
            beer.description = [rawBeer objectForKey:@"description"];
            beer.imageUrl = [rawBeer objectForKey:@"image_url"];
            [self.beers addObject:beer];
        }
        
        self.isLoading = NO;
        
        [self triggerEvent:@"updateBeerList" param:self.beers];
        [self triggerEvent:@"isLoadingChange" param:self.beers];
        
    } errorHandler:^(NSDictionary * error){
        self.isLoading = NO;
        self.error = error;
        // do something
    }];
}

- (void)fetchBeer:(int)beerId sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSDictionary * _Nonnull))errorHandler{}


@end
