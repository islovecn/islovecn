//
//  TimeViewController.m
//  mobile
//
//  Created by Rain on 13-3-21.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController ()

@end

@implementation TimeViewController
@synthesize storeName,storeNote,storeClose,storeOpen;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self initTopbar];
    
    scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, kDeviceWidth, KDeviceHeight-65)];
    scrollview.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scrollview];
    
    UIImageView *timebg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 112)];
    timebg.image=[UIImage imageNamed:@"time_header_bg"];
    
    lblOpen=[[UILabel alloc] initWithFrame:CGRectMake(220, 26, 85, 28)];
    lblOpen.text=@"10:00"; 
    lblOpen.font=[UIFont systemFontOfSize:22.0];
    lblOpen.textAlignment=UITextAlignmentCenter;
    lblOpen.backgroundColor=[UIColor clearColor];
    lblOpen.textColor=[UIColor colorWithRed:235/255.0 green:132/255.0 blue:175/255.0 alpha:1.0];
    [timebg addSubview:lblOpen];
 
    lblClose=[[UILabel alloc] initWithFrame:CGRectMake(220, 56, 85, 28)];
    lblClose.text=@"22:00";
    lblClose.textColor=[UIColor whiteColor];
    lblClose.backgroundColor=[UIColor clearColor];
    lblClose.font=[UIFont systemFontOfSize:22.0];
    lblClose.textAlignment=UITextAlignmentCenter; 
    [timebg addSubview:lblClose];
    
    UIImageView *storebg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 112, kDeviceWidth, 112)];
    storebg.image=[UIImage imageNamed:@"details_img.jpg"];
    
    lblName=[[UILabel alloc] initWithFrame:CGRectMake(0, 72, kDeviceWidth, 40)];
    lblName.textColor=[UIColor whiteColor];
    lblName.font=[UIFont boldSystemFontOfSize:22.0];
    lblName.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [storebg addSubview:lblName];
 
    
    tvdesc=[[UITextView alloc] initWithFrame:CGRectMake(9, 224, 302, KDeviceHeight-275)];
    tvdesc.text=@"    全城热恋钻石商场是国内首创 “奢侈品快消”概念的时尚钻石商场。首创国际钻石报价单销售钻石与戒托分离计价模式。目前北京有双井富力广场店，崇文门国瑞城店、西单店、朝阳门悠唐店、德胜门工美店五家店铺。";
    tvdesc.font=[UIFont systemFontOfSize:19.0];
    tvdesc.textColor=[UIColor grayColor];
    tvdesc.backgroundColor=[UIColor clearColor];
    
    [scrollview addSubview:timebg];
    [scrollview addSubview:storebg];
    [scrollview addSubview:tvdesc];
}

-(void)initTopbar{
    UIImageView *topBar=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
    topBar.image=[UIImage imageNamed:@"top_bar"];
    topBar.userInteractionEnabled=YES;
    
    UIImageView *topBarName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-83)/2, 10, 83, 27)];
    topBarName.image=[UIImage imageNamed:@"time_header_txt"];
    [topBar addSubview:topBarName];
    [topBarName release];
    
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(10, 10, 26, 26);
    [btnBack setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    [btnBack setImage:[UIImage imageNamed:@"arrow_left_hover"] forState:UIControlStateHighlighted];
    [btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:btnBack];
    
    [self.view addSubview:topBar];
    [topBar release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
}

-(void)loadData{
    lblName.text=[NSString stringWithFormat:@"   %@",self.storeName];
    lblOpen.text=self.storeOpen;
    lblClose.text=self.storeClose;
}

#pragma mark - Click Events
-(void)clickBack{ 
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
