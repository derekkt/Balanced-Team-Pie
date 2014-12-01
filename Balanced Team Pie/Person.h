//
//  Person.h
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/9/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#ifndef Balanced_Team_Pie_Person_h
#define Balanced_Team_Pie_Person_h


#endif

@interface Person: NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *pin;
-(void) setName:(NSString*) newName;
-(NSString*) getName;

-(void) setPin:(NSString*) newPin;
-(NSString*)getPin;
@end
