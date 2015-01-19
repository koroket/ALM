//
//  LoginViewController.m
//  AppLionMobile
//
//  Created by sloot on 1/18/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import "LoginViewController.h"
#import "RailsCommunication.h"
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

- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}
- (IBAction)loginPressed:(id)sender {
    [[RailsCommunication sharedCommunicator] loginWithCompletion:^(NSData *data,
                                              NSURLResponse *response,
                                              NSError *error)
     {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSInteger responseStatusCode = [httpResponse statusCode];
         
         NSDictionary *fetchedData = [NSJSONSerialization JSONObjectWithData:data
                                                                options:0
                                                                  error:nil];
         NSLog(@"ERROR: %@\n",fetchedData);
         NSLog(@"NSURLRESPONSE: %@\n",response);
         NSLog(@"NSERROR: %@\n",error);
         
     }];
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
