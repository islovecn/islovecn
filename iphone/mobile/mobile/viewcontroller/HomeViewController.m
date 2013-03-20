//
//  HomeViewController.m
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
 

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.backgroundColor=[UIColor grayColor];
    btnLogin.frame=CGRectMake(20, 50, 100, 40);
    
    UIButton* btnPay=[UIButton buttonWithType:UIButtonTypeCustom];
    btnPay.backgroundColor=[UIColor grayColor];
    btnPay.frame=CGRectMake(140, 50, 100, 40);
    [btnPay addTarget:self action:@selector(clickPay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
    [self.view addSubview:btnPay];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController setToolbarHidden:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Events
-(void)clickPay{
    [AppHelper showAlertMessage:@"建设中，敬请期待。" title:@"" ];
}

@end
