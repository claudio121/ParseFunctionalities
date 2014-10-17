//
//  LoginViewController.h
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signIn:(id)sender;

- (IBAction)login:(id)sender;
@end
