//
//  ZCJSONKit.h
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCJSONKit : NSObject

@end
@interface NSString(JSONCategories)

+(NSString *)stringFromJSONData:(NSData *)jsonData;
+(NSString *)stringFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error;

-(NSData *)toJSON;
-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

@interface NSArray(JSONCategories)

+(NSArray *)arrayFromJSONData:(NSData *)jsonData;
+(NSArray *)arrayFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error;

-(NSData *)toJSON;
-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

@interface NSDictionary(JSONCategories)

+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData;
+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error;

-(NSData *)toJSON;
-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error;

@end

