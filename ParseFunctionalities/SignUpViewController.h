//
//  SignUpViewController.h
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UIImagePickerControllerDelegate , UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)register:(id)sender;
- (IBAction)editImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)cancel:(id)sender;


@end
