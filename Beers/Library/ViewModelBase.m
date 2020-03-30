//
//  ViewModelBase.m
//  Beers
//
//  Created by Pedro Costa on 30/03/2020.
//  Copyright © 2020 Pedro Costa. All rights reserved.
//

#import "ViewModelBase.h"
typedef void (^eventCallbackType)(id);
@implementation ViewModelBase

- (instancetype)init
{
    self = [super init];
    if (self) {
        events = [NSMutableDictionary new];
    }
    return self;
}




- (void)listenEvent:(NSString *)eventName callback:(eventCallbackType)callback{
    
    if(![events objectForKey:eventName]){
        NSMutableArray *callbackArray = [NSMutableArray new];
        [events setValue:callbackArray forKey:eventName];
    }
    
    [[events objectForKey:eventName] addObject:callback];
}



- (void) triggerEvent:(NSString *)eventName param:(id) param{
    if(![events objectForKey:eventName]){
        return;
    }
    
    NSMutableArray *callbacks = [events objectForKey:eventName];
    
    for ( eventCallbackType callback in callbacks) {
        callback(param);
    }
    
    
}



@end
