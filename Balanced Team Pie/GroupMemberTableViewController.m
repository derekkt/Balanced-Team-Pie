//
//  GroupMemberTableViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/29/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "GroupMemberTableViewController.h"
#import "ManagerSettingsViewController.h"
#import "NewPersonViewController.h"

@interface GroupMemberTableViewController ()
@property (nonatomic, retain) IBOutlet UITableView *tableview;


@end

@implementation GroupMemberTableViewController
@synthesize group;
@synthesize tableview;
@synthesize selectedRowIndex;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[[group getPerson:selectedRowIndex] getName]);
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backListener:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)settingsListener:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Enter Manager Pin" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
    alertView.tag = 2;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(alertView.tag == 2){
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        if([alertTextField.text isEqualToString:[group getManagerPin]]){
            [self performSegueWithIdentifier: @"managerSettingsSegue" sender: self];
        }else{
            NSString *message = @"Incorrect manager pin. Try again.";
            int duration = 2;
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });
            
        }
    }else if (alertView.tag == 3){
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        if([alertTextField.text isEqualToString:[group getManagerPin]]){
            [self performSegueWithIdentifier: @"newPersonSegue" sender: self];
        }else{
            NSString *message = @"Incorrect manager pin. Try again.";
            int duration = 2;
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });
            
        }

        
    }else if (alertView.tag == 4){
        UITextField * alertTextField = [alertView textFieldAtIndex:0];
        if([alertTextField.text isEqualToString:[[group getPerson:selectedRowIndex] getPin]]){
            NSLog(@"login for %@ successful", [[group getPerson:selectedRowIndex] getName]);
            //ADD CODE HERE TO PERFORM SEGUE TO PIES**************************
            //[self performSegueWithIdentifier: @"newPersonSegue" sender: self];
        }else{
            NSString *message = @"Incorrect pin. Try again.";
            int duration = 2;
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });
            
        }
        
        
    }

    // do whatever you want to do with this UITextField.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [group getNumberOfMembers]+1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if(indexPath.row < [group getNumberOfMembers])
        cell.textLabel.text = [[group getPerson:indexPath.row]getName];
    else
        cell.textLabel.text = @"Add another member...";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == [group getNumberOfMembers]){
        UIAlertView *checkPin = [[UIAlertView alloc] initWithTitle:@"Enter Manager Pin" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
        checkPin.tag = 3;
        checkPin.alertViewStyle = UIAlertViewStylePlainTextInput;
        [checkPin show];
    }else{
        UIAlertView *checkPin = [[UIAlertView alloc] initWithTitle:@"Enter Pin" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
        checkPin.tag = 4;
        checkPin.alertViewStyle = UIAlertViewStylePlainTextInput;
        selectedRowIndex = indexPath.row;
        [checkPin show];
        
    }
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"managerSettingsSegue"]) {
        ManagerSettingsViewController *nextVC = (ManagerSettingsViewController *)[segue destinationViewController];
        nextVC.group = group;
    }else if ([[segue identifier] isEqualToString:@"newPersonSegue"]) {
        NewPersonViewController *nextVC = (NewPersonViewController *)[segue destinationViewController];
        nextVC.group = group;
        nextVC.tableview = self.tableview;
    }
}


@end
