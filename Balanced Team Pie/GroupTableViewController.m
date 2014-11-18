//
//  GroupTableViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/10/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "GroupTableViewController.h"

@interface GroupTableViewController ()

@end

@implementation GroupTableViewController
@synthesize group;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonListener:(id)sender {
    NSLog(@"%@", [group getGroupName]);
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
