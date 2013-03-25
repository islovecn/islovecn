//
//  ReasonCell.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "ReasonCell.h"

@implementation ReasonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        lblRed=[[UILabel alloc] initWithFrame:CGRectMake(10, 12, kDeviceWidth-20, 40)];
        lblRed.font=[UIFont boldSystemFontOfSize:24.0];
        lblRed.textColor=[UIColor colorWithRed:230/255.0 green:62/255.0 blue:105/255.0 alpha:1.0];
        
        lblBlack=[[UILabel alloc] initWithFrame:CGRectMake(10, 45, kDeviceWidth-20, 24)];
        lblBlack.font=[UIFont systemFontOfSize:19.0];
        lblBlack.textColor=[UIColor blackColor];
        
        lblGray=[[UILabel alloc] initWithFrame:CGRectMake(10, 70, kDeviceWidth-20, 20)];
        lblGray.font=[UIFont systemFontOfSize:13.0];
        lblGray.textColor=[UIColor grayColor];
        
        UIView* vline=[[UIView alloc] initWithFrame:CGRectMake(0, 109, kDeviceWidth, 1)];
        vline.backgroundColor=[UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1.0];
        
        [self.contentView addSubview:lblRed];
        [self.contentView addSubview:lblBlack];
        [self.contentView addSubview:lblGray];
        [self.contentView addSubview:vline];
        [vline release];
    }
    return self;
}

-(void)loadData:(NSDictionary*)dict{
    lblRed.text=[dict objectForKey:@"red"];
    lblBlack.text=[dict objectForKey:@"black"];
    lblGray.text=[dict objectForKey:@"gray"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
