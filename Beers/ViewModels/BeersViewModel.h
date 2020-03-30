//
//  BeersViewModel.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelBase.h"
#import "BeersRepo.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeersViewModel : ViewModelBase

@property BOOL     isLoading;
// api error
@property NSDictionary *error;
@property NSMutableArray *beers;
@property int currentPage;
@property int itemsPerPage;

- (void) fetchList:(int) page itemsPerPage:(int) per_page sucessHandler:(void(^)(NSArray *data)) successHandler errorHandler:(void(^)(NSDictionary *data)) errorHandler;

- (void) fetchBeer:(int)beerId sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSDictionary * _Nonnull))errorHandler;

@end

NS_ASSUME_NONNULL_END
