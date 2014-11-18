//
//  PSRPersonStore.h
//  Balanced Team Pie
//
//  Created by Peter Srivongse on 11/17/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSRPerson;

@interface PSRPersonStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;


+ (instancetype)sharedStore;
@end
