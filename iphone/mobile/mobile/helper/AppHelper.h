//
//  AppHelper.h
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHelper : NSObject
+ (NSString*)getStringConfig:(NSString*)key;
+ (void)setStringConfig:(NSString*)key val:(NSString*)val;

+ (BOOL)getBoolConfig:(NSString*)key;
+ (void)setBoolConfig:(NSString*)key val:(BOOL)val;

+ (int)getIntConfig:(NSString*)key;
+ (void)setIntConfig:(NSString*)key val:(int)val;
@end
