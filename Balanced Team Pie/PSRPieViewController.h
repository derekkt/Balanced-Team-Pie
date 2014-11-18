//
//  PSRPieViewController.h
//  Balanced Team Pie
//
//  Created by Peter Srivongse on 11/17/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSRPerson;

@interface PSRPieViewController : UIViewController

- (instancetype)initForNewPie:(BOOL)isNew;

@property (nonatomic, strong) PSRPerson *person;
@property (nonatomic, copy) void (^dismissBlock) (void);

@end
