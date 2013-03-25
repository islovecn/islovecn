//
//  AddressViewController.h
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : UIViewController
{
    UIScrollView *scrollview;
    UITextView *tvdesc;
    UILabel* lblName;
    UIImageView *timebg;
}
@property (nonatomic,retain) NSString* storeName;
@property (nonatomic,retain) NSString* storeNote;
@property (nonatomic,retain) NSString* storeMap; 

-(void)loadData;
@end
