//
//  AppCommunication.h
//  AppLionMobile
//
//  Created by sloot on 1/19/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppCommunication : NSObject
+ (instancetype)sharedCommunicator;
@property (nonatomic,strong) NSArray* opportunities;
@property (nonatomic,strong) NSString* email;
@property (nonatomic,assign) int selectedOpportunityIndex;

@end
