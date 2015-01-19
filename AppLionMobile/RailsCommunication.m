//
//  RailsCommunication.m
//  AppLionMobile
//
//  Created by sloot on 1/18/15.
//  Copyright (c) 2015 sloot. All rights reserved.
//

#import "RailsCommunication.h"
@interface RailsCommunication ()

@property (nonatomic, strong) NSURLSession* session;

@end

@implementation RailsCommunication

static NSString *const APITOKEN= @"jormasa";
static NSString *const ROOTURL= @"http://applion.herokuapp.com/";
- (instancetype)init
{
    self = [super init];
    if (!self)
        return nil;
    // Create a session configuration
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = 30.0;
    sessionConfiguration.timeoutIntervalForResource = 30.0;
    sessionConfiguration.HTTPAdditionalHeaders = @{
                                                   @"Accept" : @"application/json",
                                                   @"Content-Type" : @"application/json",
                                                   @"API-token" : APITOKEN
                                                   } ;
    self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    return self;
}
+ (instancetype)sharedCommunicator
{
    static RailsCommunication *sharedCommunicator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedCommunicator = [[RailsCommunication alloc] init];
                  });
    return sharedCommunicator;
}
-(void)loginWithCompletion:(void (^)(NSData *data,
                                     NSURLResponse *response,
                                     NSError *error))completion
{

    NSString *fixedUrl = [NSString stringWithFormat:@"%@%@",
                          ROOTURL,@"api/login"];
    NSURL *url = [NSURL URLWithString:fixedUrl];
    // Request
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    // Request type
    [request setHTTPMethod:@"GET"];
    // Session
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:request
                  completionHandler:completion];
    [dataTask resume];
}
-(void)loginWithInput:(NSDictionary*) input withCompletion:(void (^)(NSData *data,
                                     NSURLResponse *response,
                                     NSError *error))completion
{
    
    NSString *fixedUrl = [NSString stringWithFormat:@"%@%@",
                          ROOTURL,@"api/login"];
    NSURL *url = [NSURL URLWithString:fixedUrl];
    // Request
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    // Request type
      [request setValue:input[@"email"] forHTTPHeaderField:@"email"];
      [request setValue:input[@"password"] forHTTPHeaderField:@"password"];
    [request setHTTPMethod:@"GET"];
    // Session
    NSURLSessionDataTask *dataTask =
    [self.session dataTaskWithRequest:request
                    completionHandler:completion];
    [dataTask resume];
}

@end
