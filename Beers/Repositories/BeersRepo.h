//
//  Beers.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeerModel.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeersRepo : NSObject


+ (void) fetchList:(int) page itemsPerPage:(int) per_page sucessHandler:(void(^)(NSArray *data)) successHandler errorHandler:(void(^)(NSError *data)) errorHandler;
+ (void) fetchBeer:(int)beerId sucessHandler:(void (^)(NSArray * _Nonnull))successHandler errorHandler:(void (^)(NSError * _Nonnull))errorHandler;


@end

NS_ASSUME_NONNULL_END
