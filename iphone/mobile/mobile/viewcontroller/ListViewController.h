//
//  ListViewController.h
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
#import "DetailViewController.h"
@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray* arrDiamond;
    UITableView* tbWhy;
}
@end
