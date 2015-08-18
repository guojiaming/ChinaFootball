//
//  ZCRequestHelper.m
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import "ZCRequestHelper.h"
#import "ZCNetwork.h"

@implementation ZCRequestHelper
-(id)initWithKey:(NSInteger)requestKey delegate:(id<ZCRequestDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.requestKey = requestKey;
        self.delegate = delegate;
//        self.reqMethod = GET;
//        self.reqSerializer = JSON;
//        self.validationTime = 10;
//        self.userInfo = nil;
//        _isCancelled = NO;
    }
    return self;
}

- (void)getJSONDataWithUrl:(NSString *)URLString parameters:(NSDictionary *)parameters{
//    [[ZCNetwork sharedInstance]setValidationTime:10];
    [[ZCNetwork sharedInstance]getJSONDataWithUrl:URLString parameters:parameters success:^(AFHTTPRequestOperation *opration, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestSuccess:result:)]) {
            [self.delegate requestSuccess:_requestKey result:responseObject];
        }
    } fail:^(NSError *error) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(requestFail:error:)])
        [self.delegate requestFail:_requestKey error:error];
    }];
}

- (void)getImageDataWithUrl:(NSString *)URLString parameters:(NSDictionary *)parameters{
//    [[ZCNetwork sharedInstance]setValidationTime:10];
    [[ZCNetwork sharedInstance]getJSONDataWithUrl:URLString parameters:parameters success:^(AFHTTPRequestOperation *opration, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestSuccess:result:)]) {
            [self.delegate requestSuccess:_requestKey result:responseObject];
        }
    } fail:^(NSError *error) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(requestFail:error:)])
            [self.delegate requestFail:_requestKey error:error];
    }];
}

- (void)postDataWithUrl:(NSString *)URLString httpBody:(NSString *)jsonBody{
//    [[ZCNetwork sharedInstance]setValidationTime:10];
    [[ZCNetwork sharedInstance]postDataWithUrl:URLString httpBody:jsonBody success:^(AFHTTPRequestOperation *opration, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestSuccess:result:)]) {
            [self.delegate requestSuccess:_requestKey result:responseObject];
        }
    } fail:^(NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestFail:error:)]) {
            [self.delegate requestFail:_requestKey error:error];
        }
    }];
}

- (void)postMultiFromDataWithUrl:(NSString *)URLString FromData:(NSData *)data{
//    [[ZCNetwork sharedInstance]setValidationTime:10];
    [[ZCNetwork sharedInstance]postMultiFromDataWithUrl:URLString FromData:data success:^(AFHTTPRequestOperation *opration, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestSuccess:result:)]) {
            [self.delegate requestSuccess:_requestKey result:responseObject];
        }
    } fail:^(NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(requestFail:error:)]) {
            [self.delegate requestFail:_requestKey error:error];
        }
    }];
}

@end
