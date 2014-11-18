//
//  Group.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/9/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Group.h"
#import "Person.h"
#import "Pie.h"

@implementation Group{
    NSString* groupName;
    NSString* password;
    NSMutableArray *groupMembers;
    NSMutableArray *skillsOfMembers;
}
-(id) init{
    self = [super init];
    if(self){
        NSLog(@"inside group constructor");
        groupMembers = [[NSMutableArray alloc] init];
        skillsOfMembers = [[NSMutableArray alloc] init];
        groupName = [[NSString alloc]init];
        password =  [[NSString alloc]init];
    }
    return self;
}

-(NSInteger) authenticate:(NSString *)checkGroupName :(NSString *)checkPassword{
    if([checkGroupName isEqualToString:groupName]&&[checkPassword isEqualToString:password]){
        return 1;
    }
    return 0;
}

-(void) setGroup:(NSMutableArray*)newGroupMembers{
    groupMembers = newGroupMembers;
}
-(NSMutableArray*) getGroup{
    return groupMembers;
}
-(Person*) getPerson:(int) index{
    return [groupMembers objectAtIndex:index];
}
-(void) setPerson:(int) index :(Person*) newPerson{
    Person* person = [groupMembers objectAtIndex:index];
    person = newPerson;
}


-(NSMutableArray*) getSkillsOfPerson:(int)index{
    return [skillsOfMembers objectAtIndex:index];
}
-(void) setSkillsOfPerson:(Pie*) newSkills :(int)index{
    Pie *skillsOfMember = [skillsOfMembers objectAtIndex:index];
    skillsOfMember = newSkills;
}


-(void) setGroupName:(NSString*) newName{
    groupName = [newName copy];
}

-(NSString*) getGroupName{
    return groupName;
}

-(void) setPassword:(NSString*) newPassword{
    password = [newPassword copy];
}

-(NSString*) getPassword{
    return password;
}




@end