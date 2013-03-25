//
//  HomeViewController.h
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCell.h"
#import "LoginViewController.h"
#import "RegistViewController.h"
#import "TimeViewController.h"
#import "AddressViewController.h"
#import "TrafficViewController.h"
#import "ReasonViewController.h"

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *scrollview;
    UIScrollView* scrollShop;
    NSArray *arrStore;
    int curStoreIndex ;
}
@end
