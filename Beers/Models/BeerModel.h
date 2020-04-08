//
//  BeerModel.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BeerModel : NSObject

@property int id;
@property NSString *name;
@property NSString *tagline;
@property NSString *firstBrewed;
@property NSString *description;
@property UIImage  *image;
@property NSString *imageUrl;
@property float abv;
@property float ibu;


@property NSArray *foodPairing;
@property NSString *brewersTips;


//.........

@end

NS_ASSUME_NONNULL_END
