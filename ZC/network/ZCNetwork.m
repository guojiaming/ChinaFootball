//
//  ZCNetwork.m
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import "ZCNetwork.h"

@interface ZCNetwork()
{
    AFHTTPRequestOperation *_opration;
    NSInteger _timeInternal;
}

@property(nonatomic, strong)AFHTTPRequestOperation *operation;
@property(nonatomic, assign)NSInteger timeInternal;
@end

@implementation ZCNetwork
@synthesize operation = _opration;
@synthesize timeInternal = _timeInternal;

+ (id)sharedInstance{
    static ZCNetwork *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ZCNetwork alloc]init];
    });
    return _sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.operation = nil;
    }
    return self;
}

- (void)getJSONDataWithUrl:(NSString *)URLString parameters:(NSDictionary *)parameters success:(ZCSuccessResponseBlock)success fail:(ZCFailResponseBlock)fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.operation = [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}

- (void)getImageDataWithUrl:(NSString *)URLString parameters:(NSDictionary *)parameters success:(ZCSuccessResponseBlock)success fail:(ZCFailResponseBlock)fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.operation = [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}

- (void)postDataWithUrl:(NSString *)URLString httpBody:(NSString *)jsonBody success:(ZCSuccessResponseBlock)success fail:(ZCFailResponseBlock)fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    self.operation = [manager POST:URLString parameters:jsonBody success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}

- (void)postMultiFromDataWithUrl:(NSString *)URLString FromData:(NSData *)data success:(ZCSuccessResponseBlock)success fail:(ZCFailResponseBlock)fail{
    NSMutableURLRequest *request = nil;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    request = [manager.requestSerializer multipartFormRequestWithMethod:@"POST"
                                                              URLString:URLString
                                                             parameters:nil
                                              constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                  [formData appendPartWithFileData:data
                                                                              name:@"file"
                                                                          fileName:@"file.jpeg"
                                                                          mimeType:@"image/jpeg"];
                                              }
                                                                  error:nil];
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request
                                                                         success:success
                                                                         failure:^(AFHTTPRequestOperation *operation, NSError *error){
                                                                             fail(error);
                                                                         }];
    [manager.operationQueue addOperation:operation];
}

- (void)cancelAFURLRequest{
    
}

- (void)setValidationTimeInternal:(NSTimeInterval)time{
    time = 10;
}

@end
