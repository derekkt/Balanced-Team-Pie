//
//  NewPersonViewController.m
//  Balanced Team Pie
//
//  Created by Derek Tong on 11/30/14.
//  Copyright (c) 2014 Derek Tong. All rights reserved.
//

#import "NewPersonViewController.h"

@interface NewPersonViewController ()
@property (strong, nonatomic) IBOutlet UITextField *memberNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *pinTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPinTextField;

@end

@implementation NewPersonViewController


@synthesize group;
@synthesize tableview;
@synthesize memberNameTextField;
@synthesize confirmPinTextField;
@synthesize pinTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backListener:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addPersonListener:(id)sender {
    NSString *name = memberNameTextField.text;
    NSString *pin = pinTextField.text;
    NSString *confirmPin = confirmPinTextField.text;
    int duration = 2;
   if (![pin isEqualToString:confirmPin]){
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
        
        
    }else if ([pin length] != 5){
        NSScanner *scanner = [NSScanner scannerWithString:pin];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if(!isNumeric||[pin length] != 5){
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
    }else{
        Person* temp = [[Person alloc]init];
        [temp setName:name];
        [temp setPin:pin];
        [group addPerson:temp];
        [self.tableview reloadData];
        [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    }
    
    
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
