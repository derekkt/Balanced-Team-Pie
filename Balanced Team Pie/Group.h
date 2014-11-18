//
//  Group.h
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/9/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#ifndef Balanced_Team_Pie_Group_h
#define Balanced_Team_Pie_Group_h


#endif

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Pie.h"


@interface Group: NSObject
@property(nonatomic, retain) NSMutableArray *groupMembers;
@property(nonatomic, retain) NSMutableArray *skillsOfMembers;
@property(nonatomic, retain) NSString *groupName;
@property(nonatomic,retain) NSString *password;


-(id) init;
-(NSInteger)authenticate:(NSString*) checkGroupName :(NSString*) checkPassword;
-(void) setGroup:(NSMutableArray*)newGroupMembers;
-(NSMutableArray*) getGroup;
-(Person*) getPerson:(int) index;
-(void) setPerson:(int) index :(Person*) newPerson;

-(NSMutableArray*) getSkillsOfPerson:(int)index;
-(void) setSkillsOfPerson:(Pie*) newSkills :(int) index;

-(void) setGroupName:(NSString*) newName;

-(NSString*) getGroupName;

-(void) setPassword:(NSString*) newPassword;

-(NSString*) getPassword;







@end