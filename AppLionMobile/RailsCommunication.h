//
//  RailsCommunication.h
//  AppLionMobile
//
//  Created by sloot on 1/18/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RailsCommunication : NSObject
+ (instancetype)sharedCommunicator;
-(void)loginWithCompletion:(void (^)(NSData *data,
                                     NSURLResponse *response,
                                     NSError *error))completion;
@end
