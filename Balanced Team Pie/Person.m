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
    NSString *pin;
}

-(void) setName:(NSString *)newName{
    name = newName;
}

-(NSString*) getName{
    return name;
}


-(void) setPin:(NSString*) newPin{
    pin = newPin;
}
-(NSString*)getPin{
    return pin;
}





@end

