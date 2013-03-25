//
//  TrafficViewController.h
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrafficViewController : UIViewController
{
    UIScrollView *scrollview;
    UITextView *tvTraffic;
    UILabel* lblName;
    UIImageView *timebg;
    UIWebView * webview;
}
@property (nonatomic,retain) NSString* storeName;
@property (nonatomic,retain) NSString* storeTraffic;
@property (nonatomic,retain) NSString* storeMap;

-(void)loadData;
@end
