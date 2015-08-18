//
//  ZCNetwork.h
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^ZCSuccessResponseBlock)(AFHTTPRequestOperation *opration,id responseObject);
typedef void (^ZCFailResponseBlock)(NSError *error);

@interface ZCNetwork : NSObject
/**
 *  单例
 */
+(id)sharedInstance;
/**
 *  get请求JSON数据
 */
- (void)getJSONDataWithUrl:(NSString*)URLString
                parameters:(NSDictionary*)parameters
                   success:(ZCSuccessResponseBlock)success
                      fail:(ZCFailResponseBlock)fail;
/**
 *  get请求图片
 */
- (void)getImageDataWithUrl:(NSString*)URLString
                 parameters:(NSDictionary*)parameters
                    success:(ZCSuccessResponseBlock)success
                       fail:(ZCFailResponseBlock)fail;
/**
 *  post请求
 */
- (void)postDataWithUrl:(NSString *)URLString
               httpBody:(NSString*)jsonBody
                success:(ZCSuccessResponseBlock)success
                   fail:(ZCFailResponseBlock)fail;
/**
 *  上传到服务器
 *
 *  @param URLString url
 *  @param data      data数据
 *  @param success   请求成功
 *  @param fail      请求失败
 */
- (void)postMultiFromDataWithUrl:(NSString*)URLString
                        FromData:(NSData*)data
                         success:(ZCSuccessResponseBlock)success
                            fail:(ZCFailResponseBlock)fail;
/**
 *  取消AFNetworking的网络请求
 */
- (void)cancelAFURLRequest;

- (void)setValidationTimeInternal:(NSTimeInterval)time;

@end
