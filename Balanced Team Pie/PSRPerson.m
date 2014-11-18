//
//  PSRPerson.m
//  Balanced Team Pie
//
//  Created by Peter Srivongse on 11/17/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "PSRPerson.h"

#pragma mark Initializers

@implementation PSRPerson

- (instancetype)init
{
    self = [super init];
    
    if (self){
        _name = @"John Doe";
        return self;
    }
    
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    
}

@end
