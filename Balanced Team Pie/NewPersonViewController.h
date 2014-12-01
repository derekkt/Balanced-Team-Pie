//
//  NewPersonViewController.h
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/30/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"
#import "GroupMemberTableViewController.h"

@interface NewPersonViewController : UIViewController
@property Group* group;
@property UITableView *tableview;

@end
