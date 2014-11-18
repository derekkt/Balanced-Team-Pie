//
//  Person.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/9/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@implementation Person
{
    NSString *name;
}

-(void) setName:(NSString *)newName{
    name = newName;
}

-(NSString*) getName{
    return name;
}



@end

