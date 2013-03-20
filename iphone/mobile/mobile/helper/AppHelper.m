//
//  AppHelper.m
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

+ (NSString*)getStringConfig:(NSString*)key{
    NSString *temp = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    return temp?temp:@"";
}

+ (void)setStringConfig:(NSString*)key val:(NSString*)val{
    [[NSUserDefaults standardUserDefaults] setObject:val forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getBoolConfig:(NSString*)key{
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (void)setBoolConfig:(NSString*)key val:(BOOL)val{
    [[NSUserDefaults standardUserDefaults] setBool:val forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (int)getIntConfig:(NSString*)key{
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+ (void)setIntConfig:(NSString*)key val:(int)val{
    [[NSUserDefaults standardUserDefaults] setInteger: val forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
