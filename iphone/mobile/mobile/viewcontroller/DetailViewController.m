//
//  DetailViewController.m
//  mobile
//
//  Created by Rain on 13-3-25.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
 
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTopbar];
}

-(void)initTopbar{
    UIImageView *topBar=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
    topBar.image=[UIImage imageNamed:@"top_bar"];
    topBar.userInteractionEnabled=YES;
    
    UIImageView *topBarName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-71)/2, 11, 71, 24)];
    topBarName.image=[UIImage imageNamed:@"details_header_txt"];
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Events
-(void)clickBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
