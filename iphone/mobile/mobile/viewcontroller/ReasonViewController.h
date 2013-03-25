//
//  ReasonViewController.h
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReasonCell.h"

@interface ReasonViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* tbWhy;
    NSArray* arrReason;
}
@end
