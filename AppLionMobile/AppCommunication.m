//
//  AppCommunication.m
//  AppLionMobile
//
//  Created by sloot on 1/19/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import "AppCommunication.h"

@implementation AppCommunication
+ (instancetype)sharedCommunicator
{
    static AppCommunication *sharedCommunicator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedCommunicator = [[AppCommunication alloc] init];
                  });
    return sharedCommunicator;
}
@end
