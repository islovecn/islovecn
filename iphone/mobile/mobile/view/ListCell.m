//
//  ListCell.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        lblName=[[UILabel alloc] initWithFrame:CGRectMake(10, 20, 250, 24)];
        lblName.font=[UIFont boldSystemFontOfSize:18.0];
        lblName.textAlignment=UITextAlignmentCenter;
        lblName.textColor=[UIColor blackColor];
        lblName.backgroundColor=[UIColor clearColor];
        
        img=[[UIImageView alloc] initWithFrame:CGRectMake(260, 10, 50, 50)];
        img.contentMode=UIViewContentModeScaleAspectFill;
        
        vline=[[UIView alloc] initWithFrame:CGRectMake(0, 69, kDeviceWidth, 1)];
        vline.backgroundColor=[UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1.0];
        
        [self.contentView addSubview:lblName];
        [self.contentView addSubview:img];
        [self.contentView addSubview:vline];
    }
    return self;
}

-(void)loadData:(NSDictionary*)dict{
    if (dict) {
        lblName.text=[dict objectForKey:@"name"];
        img.image=[UIImage imageNamed:[dict objectForKey:@"image"]];
        vline.frame= CGRectMake(0, 69, kDeviceWidth, 1);
    }
    else{
        lblName.text=@"";
        img.image=nil;
        vline.frame= CGRectMake(0, 11, kDeviceWidth, 1);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
