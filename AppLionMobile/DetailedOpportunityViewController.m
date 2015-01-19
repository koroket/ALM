//
//  DetailedOpportunityViewController.m
//  AppLionMobile
//
//  Created by sloot on 1/19/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import "DetailedOpportunityViewController.h"
#import "AppCommunication.h"
@interface DetailedOpportunityViewController ()
@property (strong, nonatomic) IBOutlet UILabel *companyLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UILabel *salaryLabel;
@property (strong, nonatomic) IBOutlet UITextView *notesTextView;

@end

@implementation DetailedOpportunityViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSDictionary* selectedOpportunity = [AppCommunication sharedCommunicator].opportunities[[AppCommunication sharedCommunicator].selectedOpportunityIndex];
    NSDictionary* company = selectedOpportunity[@"company"];
    self.companyLabel.text = company[@"name"];
    self.positionLabel.text = selectedOpportunity[@"position"];
    
    if([selectedOpportunity[@"salary"] isKindOfClass:[NSString class]]){
        self.salaryLabel.text = selectedOpportunity[@"salary"];
    }
    else{
        self.salaryLabel.text = @"No salary inputted";
    }
    
    if([selectedOpportunity[@"notes"] isKindOfClass:[NSString class]]){
        self.notesTextView.text = selectedOpportunity[@"notes"];
    }
    else{
        self.notesTextView.text = @"No notes inputted";
    }
}
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

@end
