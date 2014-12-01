//
//  NewGroupViewController.h
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/3/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//


#import "Group.h"


@interface NewGroupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword;
@property (strong, nonatomic) NSMutableArray* groups;
@property (strong, nonatomic) IBOutlet UITextField *managerPin;
@property (strong, nonatomic) IBOutlet UITextField *confirmPin;


@end
