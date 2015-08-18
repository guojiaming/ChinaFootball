//
//  ZCJSONKit.m
//  ZC
//
//  Created by 9hgame on 15/8/18.
//  Copyright (c) 2015年 9hgame. All rights reserved.
//

#import "ZCJSONKit.h"

@implementation ZCJSONKit

@end

@implementation NSString(JSONCategories)

+(NSString *)stringFromJSONData:(NSData *)jsonData
{
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
    
}
+(NSString *)stringFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error
{
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:opt error:error];
    if (error != nil) return nil;
    return result;
}

-(NSData *)toJSON
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError* error = nil;
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error != nil) return nil;
        return result;
    }else{
        return [self dataUsingEncoding:NSUTF8StringEncoding];
    }
    
}

-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        id result = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;
    }
}

@end

@implementation NSArray(JSONCategories)

+(NSArray *)arrayFromJSONData:(NSData *)jsonData
{
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
+(NSArray *)arrayFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error
{
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:opt error:error];
    if (error != nil) return nil;
    return result;
}

-(NSData *)toJSON
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError* error = nil;
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;//-.[NSKeyedArchiver archivedDataWithRootObject:self];
    }
}

-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        id result = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;
    }
}

@end

@implementation NSDictionary(JSONCategories)

+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData
{
    if (jsonData==nil) {
        return nil;
    }
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error
{
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:opt error:error];
    if (error != nil) return nil;
    return result;
}

-(NSData *)toJSON
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError* error = nil;
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;//[NSKeyedArchiver archivedDataWithRootObject:self];
    }
    
}

-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        id result = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;
    }
}

@end

