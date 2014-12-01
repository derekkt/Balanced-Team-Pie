//
//  ManagetSettingsViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/29/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "ManagerSettingsViewController.h"

@interface ManagerSettingsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *numberOfSkillsLabel;
@property (strong, nonatomic) IBOutlet UISlider *sliderValue;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ManagerSettingsViewController
@synthesize group;
@synthesize numberOfSkillsLabel;
@synthesize sliderValue;
@synthesize tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Skill list count: %lu", (unsigned long)[group.skillList count]);
    for(int i = 0; i < [group.skillList count]; i++){
        NSLog(@"%@", [group.skillList objectAtIndex:i]);
    }
    
    NSString *sliderVal = [NSString stringWithFormat:@"%d", group.maxSkillLevel];
    NSLog(@"%@", sliderVal);
    [numberOfSkillsLabel setText:sliderVal];
    sliderValue.value = group.maxSkillLevel;
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonListener:(id)sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)numberOfSkillsSlideListener:(id)sender {
    int temp = (int)sliderValue.value;
    NSString *sliderVal = [NSString stringWithFormat:@"%d", temp];
    [numberOfSkillsLabel setText:[sliderVal copy]];
    group.maxSkillLevel = temp;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [group.skillList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

        cell.textLabel.text = [group.skillList objectAtIndex:indexPath.row];
    
        
    
    return cell;

}
- (IBAction)addNewSkillListener:(id)sender {
    UIAlertView *checkPin = [[UIAlertView alloc] initWithTitle:@"Enter new skill" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
    checkPin.tag = 2;
    checkPin.alertViewStyle = UIAlertViewStylePlainTextInput;
    [checkPin show];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag == 2){
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        [group.skillList addObject:[alertTextField.text copy]];
        [tableview reloadData];
        
        
    }
    
    // do whatever you want to do with this UITextField.
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
