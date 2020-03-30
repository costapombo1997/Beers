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
@property NSArray *beers;

@end

NS_ASSUME_NONNULL_END
