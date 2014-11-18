//
//  Pie.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/3/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pie.h"


@implementation Pie{
    int* skills;
}

int* skills;
- (int*) getSkills{
    return skills;
}

-(void)setSkills:(int[]) newSkills{
    skills = newSkills;
    
}

@end

