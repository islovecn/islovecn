//
//  HomeCell.h
//  mobile
//
//  Created by Rain on 13-3-21.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
{
    UIImageView* imgIcon;
    UILabel* lblText; 
}
-(void)loadData:(NSString*)txt imgName:(NSString*)imgName;
@end
