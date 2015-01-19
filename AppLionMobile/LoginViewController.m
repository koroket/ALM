//
//  LoginViewController.m
//  AppLionMobile
//
//  Created by sloot on 1/18/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import "LoginViewController.h"
#import "RailsCommunication.h"
#import "AppCommunication.h"
@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.errorLabel.alpha = 0.0;
}
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
    NSDictionary *input = [NSDictionary dictionaryWithObjectsAndKeys:
                                self.emailTextField.text,
                                @"email",
                                self.passwordTextField.text,
                                @"password",
                                nil];
    [[RailsCommunication sharedCommunicator] loginWithInput:input withCompletion:^(NSData *data,
                                              NSURLResponse *response,
                                              NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(), ^(void)
                        {
                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                            NSInteger responseStatusCode = [httpResponse statusCode];
                            
                            NSDictionary *fetchedData = [NSJSONSerialization JSONObjectWithData:data
                                                                                        options:0
                                                                                          error:nil];
                            
                            
                            if(responseStatusCode==200&&!fetchedData[@"error"])
                            {
                                
                                NSDictionary *userinfo = fetchedData[@"opportunities"];
                                NSArray* opplist = userinfo[@"opportunities"];
                                NSLog(@"%@",opplist);
                                NSString* email = userinfo[@"email"];
                                
                                [AppCommunication sharedCommunicator].email = userinfo[@"email"];
                                [AppCommunication sharedCommunicator].opportunities = userinfo[@"opportunities"];
                                
                                [self performSegueWithIdentifier:@"Loggingin" sender:self];
                            }
                            else
                            {
                                    self.errorLabel.alpha = 1.0;
                            }
                        });
     }];
}
- (IBAction)unwindToLoginViewController:(UIStoryboardSegue *)segue
{
    
}
//-(void)workingfunction
//{
//    [[RailsCommunication sharedCommunicator] loginWithCompletion:^(NSData *data,
//                                                                   NSURLResponse *response,
//                                                                   NSError *error)
//     {
//         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//         NSInteger responseStatusCode = [httpResponse statusCode];
//         
//         NSDictionary *fetchedData = [NSJSONSerialization JSONObjectWithData:data
//                                                                     options:0
//                                                                       error:nil];
//         NSLog(@"ERROR: %@\n",fetchedData);
//         NSLog(@"NSURLRESPONSE: %@\n",response);
//         NSLog(@"NSERROR: %@\n",error);
//         
//     }];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
