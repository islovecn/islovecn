//
//  TrafficViewController.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "TrafficViewController.h"

@interface TrafficViewController ()

@end

@implementation TrafficViewController
@synthesize storeName,storeTraffic,storeMap;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self initTopbar];
    
    scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 45, kDeviceWidth, KDeviceHeight-65)];
    scrollview.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scrollview];
    
    webview=[[UIWebView alloc] initWithFrame:CGRectMake(0, -2, kDeviceWidth, KDeviceHeight-312)];
    webview.scalesPageToFit= YES;
    
    tvTraffic=[[UITextView alloc] initWithFrame:CGRectMake(0, 166, kDeviceWidth, 138)];
    tvTraffic.font=[UIFont systemFontOfSize:19.0];
    tvTraffic.textColor=[UIColor whiteColor];
    tvTraffic.backgroundColor=[UIColor colorWithRed:232/255.0 green:67/255.0 blue:99/255.0 alpha:1.0];
    
    UIImageView *storebg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 306, kDeviceWidth, 112)];
    storebg.image=[UIImage imageNamed:@"details_img.jpg"];
    
    lblName=[[UILabel alloc] initWithFrame:CGRectMake(0, 72, kDeviceWidth, 40)];
    lblName.textColor=[UIColor whiteColor];
    lblName.font=[UIFont boldSystemFontOfSize:22.0];
    lblName.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [storebg addSubview:lblName];
    
    [scrollview addSubview:webview];
    [scrollview addSubview:tvTraffic];
    [scrollview addSubview:storebg];
}

-(void)initTopbar{
    UIImageView *topBar=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
    topBar.image=[UIImage imageNamed:@"top_bar"];
    topBar.userInteractionEnabled=YES;
    
    UIImageView *topBarName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-83)/2, 10, 83, 27)];
    topBarName.image=[UIImage imageNamed:@"transport_header_txt"];
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
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    [webview loadHTMLString:[NSString stringWithFormat:@"<img src='%@'>",self.storeMap] baseURL:baseURL];
    tvTraffic.text=self.storeTraffic;
}

#pragma mark - Click Events
-(void)clickBack{
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
