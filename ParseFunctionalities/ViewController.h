//
//  ViewController.h
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField1;
- (IBAction)button1:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
- (IBAction)close:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextView *preferencesTextView;

@end

