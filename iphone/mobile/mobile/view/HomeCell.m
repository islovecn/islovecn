//
//  HomeCell.m
//  mobile
//
//  Created by Rain on 13-3-21.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        imgIcon=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 32 , 30)];
        
        lblText=[[UILabel alloc] initWithFrame:CGRectMake(58, 10, 150, 30)];
        lblText.font=[UIFont boldSystemFontOfSize:15.0];
        lblText.textColor=[UIColor colorWithRed:91/255.0 green:76/255.0 blue:105/255.0 alpha:1.0];
        
        UIImageView* imgArrow=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        imgArrow.frame=CGRectMake(290, 18, 9, 14);
        
        UIView* vline=[[UIView alloc] initWithFrame:CGRectMake(0, 49, kDeviceWidth, 1)];
        vline.backgroundColor=[UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1.0];
        
        [self.contentView addSubview:imgIcon];
        [self.contentView addSubview:lblText];
        [self.contentView addSubview:imgArrow];
        [self.contentView addSubview:vline];
        [imgArrow release];
        [vline release];
    }
    return self;
}

-(void)loadData:(NSString*)txt imgName:(NSString*)imgName{
    lblText.text=txt;
    imgIcon.image=[UIImage imageNamed:imgName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
