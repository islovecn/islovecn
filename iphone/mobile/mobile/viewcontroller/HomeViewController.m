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
    UIImageView *imgHeader=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerimg.jpg"]];
    imgHeader.frame=CGRectMake(0, 0, kDeviceWidth, 161);
    
	UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnLogin setImage:[UIImage imageNamed:@"quickreg_but"] forState:UIControlStateNormal];
    [btnLogin setImage:[UIImage imageNamed:@"quickreg_but_hover"] forState:UIControlStateNormal];
    btnLogin.frame=CGRectMake(15, 170, 143, 37);
    [btnLogin addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnPay=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnPay setImage:[UIImage imageNamed:@"onlinepay_but"] forState:UIControlStateNormal];
    [btnPay setImage:[UIImage imageNamed:@"onlinepay_but_hover"] forState:UIControlStateNormal];
    btnPay.frame=CGRectMake(165, 170, 143, 37);
    [btnPay addTarget:self action:@selector(clickPay) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgLogo=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    imgLogo.frame=CGRectMake((kDeviceWidth-146)/2, 215, 146, 43);
    
    UIImageView *imgBar=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"midimg.jpg"]];
    imgBar.frame=CGRectMake((kDeviceWidth-313)/2, 260, 313, 109);
    
    [self.view addSubview:imgHeader];
    [self.view addSubview:btnLogin];
    [self.view addSubview:btnPay];
    [self.view addSubview:imgLogo];
    [self.view addSubview:imgBar];
    [imgHeader release];
    [imgLogo release];
    [imgBar release];
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
-(void)clickLogin{

}


-(void)clickPay{
    [AppHelper showAlertMessage:@"建设中，敬请期待。" title:@"" ];
}

@end
