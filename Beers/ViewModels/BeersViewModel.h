//
//  BeersViewModel.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeersRepo.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeersViewModel : NSObject

@property BOOL     isLoading;
@property BOOL     hasReachedtheEnd;
// api error
@property NSMutableArray *beers;
@property int currentPage;
@property int itemsPerPage;

- (void) fetchList:(int) page itemsPerPage:(int) per_page sucessHandler:(void(^)(NSArray *data)) successHandler errorHandler:(void(^)(NSDictionary *data)) errorHandler;

@end

NS_ASSUME_NONNULL_END
