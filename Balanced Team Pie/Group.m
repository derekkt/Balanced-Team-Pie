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
    NSString* managerPin;
    NSMutableArray *groupMembers;
    NSMutableArray *skillsOfMembers;
    NSInteger numberOfMembers;
    NSMutableArray* skillList;
    NSInteger maxSkillLevel;
    
}
-(id) init{
    self = [super init];
    if(self){
        NSLog(@"inside group constructor");
        groupMembers = [[NSMutableArray alloc] init];
        skillsOfMembers = [[NSMutableArray alloc] init];
        groupName = [[NSString alloc]init];
        password =  [[NSString alloc]init];
        managerPin = [[NSString alloc]init];
        numberOfMembers = 0;
        skillList = [[NSMutableArray alloc]init];
        maxSkillLevel = 5;
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

-(void) addPerson:(Person*) newPerson{
    [groupMembers addObject:newPerson];
    numberOfMembers++;
}
-(Person*) getPerson:(int) index{
    return [groupMembers objectAtIndex:index];
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

-(void)setManagerPin:(NSString *)mgrPin{
    managerPin = [mgrPin copy];
}

-(NSString*) getManagerPin{
    return managerPin;
}


-(NSInteger) getNumberOfMembers{
    return numberOfMembers;
}

-(NSMutableArray*) getSkillList{
    return skillList;
}




@end