//
//  LoginViewController.m
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{

    self.loginField.text = @"";
    self.passwordField.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */


- (IBAction)signIn:(id)sender {
}

- (IBAction)login:(id)sender {
    
    [PFUser logInWithUsernameInBackground: self.loginField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Success Logging in");
                                            [self performSegueWithIdentifier:@"login" sender:self];
                                            
                                            
                                             } else {
                                                 // The login failed. Check error to see why.
                                                 CAKeyframeAnimation * anim = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
                                                 anim.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f) ], [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f) ] ] ;
                                                 anim.autoreverses = YES ;
                                                 anim.repeatCount = 2.0f ;
                                                 anim.duration = 0.07f ;
                                                 
                                                 [ self.passwordField.layer addAnimation:anim forKey:nil ] ;
                                             }
                                             }];
}
@end
