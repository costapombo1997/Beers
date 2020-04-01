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
        //defaults
        self.currentPage = 1;
        self.itemsPerPage = 10;
        self.hasReachedtheEnd = NO;
        self.isLoading = NO;
        self.beers = [NSMutableArray new];
    }
    return self;
}




// values just for demo
- (void)fetchList:(int)page itemsPerPage:(int)per_page sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSDictionary * _Nonnull))errorHandler{
    self.isLoading = YES;
    [BeersRepo fetchList:page itemsPerPage:per_page sucessHandler:^(NSArray * data){
       
        for (NSDictionary *rawBeer in data) {
            BeerModel *beer = [BeerModel new];
            beer.name = [rawBeer objectForKey:@"name"];
            beer.description = [rawBeer objectForKey:@"description"];
            beer.imageUrl = [rawBeer objectForKey:@"image_url"];
            beer.brewersTips = [rawBeer objectForKey:@"brewers_tips"];
            beer.tagline = [rawBeer objectForKey:@"tagline"];
            [self.beers addObject:beer];
        }
        
        
        if([data count] == 0){
            self.hasReachedtheEnd = YES;
        }
        self.isLoading = NO;
        
        successHandler(self.beers);
                
    } errorHandler:^(NSDictionary * error){
        self.isLoading = NO;
        errorHandler(error);
    }];
}



@end
