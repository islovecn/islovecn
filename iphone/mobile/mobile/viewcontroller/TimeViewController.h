//
//  TimeViewController.h
//  mobile
//
//  Created by Rain on 13-3-21.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    UIScrollView *scrollview;
    UITextView *tvdesc;
    UILabel* lblName;
    UILabel* lblOpen;
    UILabel* lblClose;
}
@property (nonatomic,retain) NSString* storeName;
@property (nonatomic,retain) NSString* storeNote;
@property (nonatomic,retain) NSString* storeOpen;
@property (nonatomic,retain) NSString* storeClose;

-(void)loadData;
@end
