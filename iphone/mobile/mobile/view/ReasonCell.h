//
//  ReasonCell.h
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReasonCell : UITableViewCell
{
    UILabel* lblRed;
    UILabel* lblBlack;
    UILabel* lblGray;
}
-(void)loadData:(NSDictionary*)dict;
@end
