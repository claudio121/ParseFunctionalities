//
//  SignUpViewController.m
//  ParseFunctionalities
//
//  Created by Claudio Romano on 10/17/14.
//  Copyright (c) 2014 FIU. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController (){
    NSData *imageData;
    BOOL imagePicked;
}
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)register:(id)sender {
    PFFile *imageFile;// = [PFFile fileWithName:@"Image.jpg" data:imageData];
    if(imagePicked){
         imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    }else{
        UIImage *defaultImage = [UIImage imageNamed:@"placeholder.png"];
        imageData =  UIImageJPEGRepresentation(defaultImage,0.05f);
        imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    }
    
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    
    // other fields can be set just like with PFObject
    user[@"image"] = imageFile;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
    
}
- (IBAction)editImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypePhotoLibrary] == YES){
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Show image picker
        [self presentViewController:imagePicker animated:YES
                         completion:nil];
    }
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.image.image = image;
    imagePicked = YES;
    
    // Dismiss controller
    [picker dismissModalViewControllerAnimated:YES];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    imageData = UIImageJPEGRepresentation(image, 0.05f);
    //[self uploadImage:imageData];
    
   
    
    
    
    
}

- (IBAction)cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}
@end
