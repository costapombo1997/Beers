//
//  ViewModelBase.h
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModelBase : NSObject
{
    NSDictionary *events;
}

- (void) listenEvent:(NSString *)eventName callback:(void(^)(id)) callback;
- (void) triggerEvent:(NSString *)eventName param:(id) param;
@end

NS_ASSUME_NONNULL_END
