//
//  ZCRequestHelper.h
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCRequestDelegate <NSObject>
@required
- (void)requestSuccess:(NSInteger)requestKey result:(NSObject*)request;
- (void)requestFail:(NSInteger)requestKey error:(NSError*)error;

@optional
-(void)requestCancel:(NSInteger)requestKey;

@end

@interface ZCRequestHelper : NSObject
{
    NSInteger _requestKey;//多个网络请求区分的key
}

@property(nonatomic,assign)NSInteger requestKey;
@property(nonatomic,assign)id<ZCRequestDelegate>delegate;
//@property(nonatomic,assign)NSInteger validationTime;

-(id)initWithKey:(NSInteger) requestKey delegate:(id <ZCRequestDelegate>)delegate;
/**
 *get请求
 */
- (void)getJSONDataWithUrl:(NSString*)URLString
                parameters:(NSDictionary*)parameters;
/**
 *  get请求图片
 */
- (void)getImageDataWithUrl:(NSString*)URLString
                 parameters:(NSDictionary*)parameters;
/**
 *  post请求
 */
- (void)postDataWithUrl:(NSString *)URLString
               httpBody:(NSString*)jsonBody;
/**
 *  上传到服务器
 *
 *  @param URLString url
 *  @param data      data数据
 *  @param success   请求成功
 *  @param fail      请求失败
 */
- (void)postMultiFromDataWithUrl:(NSString*)URLString
                        FromData:(NSData*)data;

@end
