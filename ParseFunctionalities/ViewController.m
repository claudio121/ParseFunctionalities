//
//  ViewController.m
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.emailLabel.text = [[PFUser currentUser] objectForKey:@"email"];
    
    PFFile *userImageFile = [PFUser currentUser][@"image"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.userImage.image = [UIImage imageWithData:imageData];
        }
    }];
    NSArray *preferences = [PFUser currentUser][@"Preferences"];
    NSString *temp = @"";
    
    for(int i =0; i < preferences.count ; i ++){
        temp = [temp stringByAppendingString:[NSString stringWithFormat:@"%s \n",[[preferences objectAtIndex:i]UTF8String]]];
    }
    
    self.preferencesTextView.text = temp;
    
    NSMutableArray *test = @[@"1",@"2"];
    
    //[[PFUser currentUser]removeObjectsInArray:test forKey:@"Preferences"];
    
    [[PFUser currentUser]addUniqueObjectsFromArray:test forKey:@"Preferences"];
    [[PFUser currentUser]saveInBackground];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    
    
    NSDictionary *dimensions = @{@"button Pressed":button.titleLabel.text, @"Text":self.textField1.text};
    // Send the dimensions to Parse along with the 'search' event
    [PFAnalytics trackEvent:@"Button Pressed" dimensions:dimensions];
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:self.textField1.text]; // find all the women
    NSArray *girls = [query findObjects];
    
    
    
    if(girls.count >= 1){
        NSLog(@"User found: %s\n",[[[girls objectAtIndex:0] description ] UTF8String]);
        NSDictionary *dimensions = @{@"User":self.textField1.text, @"Found":@"YES"};
        [PFAnalytics trackEvent:@"User Search" dimensions:dimensions];
        self.emailLabel.text = [[girls objectAtIndex:0] objectForKey:@"email"];

        
    }else{
        NSDictionary *dimensions = @{@"User":self.textField1.text, @"Found":@"NO"};
        [PFAnalytics trackEvent:@"User Search" dimensions:dimensions];
        NSLog(@"No User Found\n");
        self.emailLabel.text = [NSString stringWithFormat:@"Not Found: %s \n",[self.textField1.text UTF8String]];
    }
    
}
- (IBAction)close:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
