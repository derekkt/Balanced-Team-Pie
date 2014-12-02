//
//  ViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/3/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//
#import "GroupMemberTableViewController.h"
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
    group1.managerPin = @"55555";
    Person* temp1 = [[Person alloc]init];
    temp1.name = @"derek";
    temp1.pin = @"11111";
    [group1 addPerson:temp1];
    Person* temp2 = [[Person alloc]init];
    temp2.name = @"charles";
    temp2.pin = @"11111";
    [group1 addPerson:temp2];
    group1.maxSkillLevel = 5;
    
    group1.skillList = [[NSMutableArray alloc]initWithObjects:@"C++",@"Python", nil];
    //[temp addObject:@"C++"];
    [groups addObject:group1];
    NSLog(@"%@",[[group1 getPerson:0]getPin]);
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
          // [self performSegueWithIdentifier: @"GroupTableSegue" sender: self];
           if([groupName isEqualToString:[group getGroupName]]&& [pword isEqualToString:[group getPassword]]){
               groupIndex = i;
            [self performSegueWithIdentifier: @"GroupMemberTableSegue" sender: self];
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
        ViewController *nextVC = (ViewController *)[segue destinationViewController];
        nextVC.groups = groups;
    }else if ([[segue identifier] isEqualToString:@"GroupMemberTableSegue"]) {
        GroupMemberTableViewController *nextVC = (GroupMemberTableViewController *)[segue destinationViewController];
        nextVC.group = [groups objectAtIndex:groupIndex];
    }
}

@end
