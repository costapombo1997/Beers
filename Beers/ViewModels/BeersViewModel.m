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
        
        // values just for demo
        [BeersRepo fetchList:2 itemsPerPage:8 sucessHandler:^(NSArray * data){
            // probably using setters to trigger events ?!
            self.beers = data;
            self.isLoading = NO;
            
        } errorHandler:^(NSDictionary * error){
            self.isLoading = NO;
            // do something
        }];
        
        
    }
    return self;
}


@end
