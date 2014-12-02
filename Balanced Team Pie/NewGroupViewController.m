//
//  NewGroupViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/3/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "NewGroupViewController.h"
#import <Foundation/Foundation.h>



@implementation NewGroupViewController{
}
@synthesize groups;
@synthesize userName;
@synthesize password;
@synthesize confirmPassword;
@synthesize managerPin;
@synthesize confirmPin;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//returns back to previous view
- (IBAction)backToLogInListener:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}



- (IBAction)createNewGroupListener:(id)sender {
    NSString *pword = password.text;
    NSString *confirmpword = confirmPassword.text;
    NSString *groupName = userName.text;
    NSString *mgrPin = managerPin.text;
    NSString *confirmMgrPin = confirmPin.text;
    int duration = 2; // duration of toast in seconds
    if([pword isEqualToString:confirmpword] && [pword length] < 5){
        NSString *message = @"Password must be longer than 4 characters. Try again.";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
    }else if ([pword isEqualToString:confirmpword] && [groupName length] < 5){
        NSString *message = @"Group name must be longer than 4 characters. Try again.";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
    }else if (![mgrPin isEqualToString:confirmMgrPin]){
        NSString *message = @"Pins do not match. Try again.";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        
        
    }else if ([mgrPin isEqualToString:confirmMgrPin] && [mgrPin length] != 5){
        NSScanner *scanner = [NSScanner scannerWithString:mgrPin];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if(!isNumeric){
            NSString *message = @"Pins must be 5 digits. Try again.";
            
            
            
            
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
    } else if ([pword isEqualToString:confirmpword]&&[mgrPin isEqualToString:confirmMgrPin]){
        
        Group *newgroup = [[Group alloc]init];
        [newgroup setGroupName: groupName];
        [newgroup setPassword: pword];
        [newgroup setManagerPin: mgrPin];
        [groups addObject:newgroup];
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
        
        
        
    }else{
        NSString *message = @"Passwords do not match. Try again.";
        
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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 */
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 

@end
