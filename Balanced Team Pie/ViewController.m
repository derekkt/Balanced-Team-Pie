//
//  ViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/3/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//
#import "PSRTableViewController.h"
#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *groupname;
@property (strong, nonatomic) IBOutlet UITextField *password;
@end

@implementation ViewController
@synthesize groups;
@synthesize groupname;
@synthesize password;

int groupIndex = -1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    groups = [[NSMutableArray alloc]init];
    
    Group *group1 =[[Group alloc] init];
    group1.groupName = @"cs480";
    group1.password=@"apple1";
    [groups addObject:group1];
    /*
    Group *group2 =[[Group alloc] init];
    group2.groupName = @"cs481";
    group2.password = @"apple2";
    [groups addObject:group2];
     */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInButton:(id)sender {
       for(int i = 0; i < [groups count]; i++){
           Group *group = [groups objectAtIndex:i];
           NSString* groupName = groupname.text;
           NSString* pword = password.text;
           [self performSegueWithIdentifier: @"GroupTableSegue" sender: self];
           if([groupName isEqualToString:[group getGroupName]]&& [pword isEqualToString:[group getPassword]]){
               groupIndex = i;
            //[self performSegueWithIdentifier: @"GroupTableSegue" sender: self];
           }else{
               NSLog(@"No Group exists");
           }
      
       }
      [self print];

}

-(void) print{
   NSLog(@"size: %lu",(unsigned long)[groups count]);

    for(int i = 0; i < [groups count]; i++){
        Group *group = [groups objectAtIndex:i];
        NSLog(@"%@\t%@\n",[group getGroupName], [group getPassword]);
        
    }

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"createNewGroupSegue"]) {
        NSLog(@"insideSegue1");
        ViewController *nextVC = (ViewController *)[segue destinationViewController];
        nextVC.groups = groups;
    }else if ([[segue identifier] isEqualToString:@"GroupTableSegue"]) {
        NSLog(@"insideSegue2");
        PSRTableViewController *nextVC = (PSRTableViewController *)[segue destinationViewController];
    }
}

@end
