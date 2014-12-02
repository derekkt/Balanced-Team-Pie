//
//  GroupMemberTableViewController.h
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/29/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface GroupMemberTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property Group *group;
@property int selectedRowIndex;

@end
