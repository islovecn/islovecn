//
//  RegistViewController.m
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "RegistViewController.h"
#define kTagName               100
#define kTagPassword           101
#define kTagPassword2          102

@interface RegistViewController ()

@end

@implementation RegistViewController
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initTopbar];
    [self initLoginArea];
}

-(void)initTopbar{
    UIImageView *topBar=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 45)];
    topBar.image=[UIImage imageNamed:@"top_bar"];
    topBar.userInteractionEnabled=YES;
    
    UIImageView *topBarName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-39)/2, 11, 39, 22)];
    topBarName.image=[UIImage imageNamed:@"reg_txt"];
    [topBar addSubview:topBarName];
    [topBarName release];
    
    UIButton *btnBack=[UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame=CGRectMake(10, 10, 26, 26);
    [btnBack setImage:[UIImage imageNamed:@"arrow_left"] forState:UIControlStateNormal];
    [btnBack setImage:[UIImage imageNamed:@"arrow_left_hover"] forState:UIControlStateHighlighted];
    [btnBack addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:btnBack];
    
    UIButton *btnReg=[UIButton buttonWithType:UIButtonTypeCustom];
    btnReg.frame=CGRectMake(kDeviceWidth-74, 6, 68, 33);
    [btnReg setImage:[UIImage imageNamed:@"top_login_but"] forState:UIControlStateNormal];
    [btnReg setImage:[UIImage imageNamed:@"top_login_but_hover"] forState:UIControlStateHighlighted];
    [btnReg addTarget:self action:@selector(gotoLogin) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:btnReg];
    
    [self.view addSubview:topBar];
    [topBar release];
}

-(void)initLoginArea{
    imgName=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-275)/2, 58, 275, 38)];
    imgName.image=[UIImage imageNamed:@"input_txt_bg"];
    imgName.userInteractionEnabled=YES;
    
    txtName=[[UITextField alloc] initWithFrame:CGRectMake(35, 7, 235, 28)];
    txtName.backgroundColor=[UIColor clearColor];
    txtName.font=[UIFont systemFontOfSize:18.0];
    txtName.textColor=[UIColor grayColor];
    txtName.delegate=self;
    txtName.tag=kTagName;
    txtName.placeholder=@"请输入您的账号";
    [imgName addSubview:txtName];
    
    
    imgPwd=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-275)/2, 104, 275, 38)];
    imgPwd.image=[UIImage imageNamed:@"input_pwd_bg"];
    imgPwd.userInteractionEnabled=YES;
    
    txtPwd=[[UITextField alloc] initWithFrame:CGRectMake(35, 7, 235, 28)];
    txtPwd.backgroundColor=[UIColor clearColor];
    txtPwd.font=[UIFont systemFontOfSize:18.0];
    txtPwd.textColor=[UIColor grayColor];
    txtPwd.secureTextEntry=YES;
    txtPwd.delegate=self;
    txtPwd.tag=kTagPassword;
    txtPwd.placeholder=@"请输入您的密码";
    [imgPwd addSubview:txtPwd];
    
    imgPwd2=[[UIImageView alloc] initWithFrame:CGRectMake((kDeviceWidth-275)/2, 150, 275, 38)];
    imgPwd2.image=[UIImage imageNamed:@"input_pwd_bg"];
    imgPwd2.userInteractionEnabled=YES;
    
    txtPwd2=[[UITextField alloc] initWithFrame:CGRectMake(35, 7, 235, 28)];
    txtPwd2.backgroundColor=[UIColor clearColor];
    txtPwd2.font=[UIFont systemFontOfSize:18.0];
    txtPwd2.textColor=[UIColor grayColor];
    txtPwd2.secureTextEntry=YES;
    txtPwd2.delegate=self;
    txtPwd2.tag=kTagPassword2;
    txtPwd2.placeholder=@"请确认您的密码";
    [imgPwd2 addSubview:txtPwd2];
    
    btnCK=[UIButton buttonWithType:UIButtonTypeCustom];
    btnCK.frame=CGRectMake(20, 205, 30, 30);
    [btnCK setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
    [btnCK addTarget:self action:@selector(clickCheck) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* lblpwd=[[UILabel alloc] initWithFrame:CGRectMake(53, 210, 80, 20)];
    lblpwd.text=@"显示密码";
    lblpwd.textColor=[UIColor grayColor];
    lblpwd.font=[UIFont systemFontOfSize:18.0];
    
    UIButton* btnReg=[UIButton buttonWithType:UIButtonTypeCustom];
    btnReg.frame=CGRectMake(kDeviceWidth-165, 200, 140, 40);
    [btnReg setImage:[UIImage imageNamed:@"reg_but"] forState:UIControlStateNormal];
    [btnReg setImage:[UIImage imageNamed:@"reg_but_hover"] forState:UIControlStateHighlighted];
    [btnReg addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imgName];
    [self.view addSubview:imgPwd];
    [self.view addSubview:imgPwd2];
    [self.view addSubview:btnCK];
    [self.view addSubview:lblpwd];
    [self.view addSubview:btnReg];
    [lblpwd release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Click Events
-(void)clickBack{ 
    [txtPwd resignFirstResponder];
    [txtName resignFirstResponder];
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

-(void)gotoLogin{
    LoginViewController* controller=[[LoginViewController alloc] init];
    [[self navigationController] pushViewController:controller animated:YES];
    [controller release];
}

-(void)clickCheck{ 
    showPassword=!showPassword;
 
    txtPwd.enabled = NO;
    txtPwd.secureTextEntry = !showPassword;
    txtPwd.enabled = YES; 
    
    txtPwd2.enabled = NO;
    txtPwd2.secureTextEntry = !showPassword;
    txtPwd2.enabled = YES;
    
    [btnCK setImage:[UIImage imageNamed: (showPassword? @"checkbox_checked":@"checkbox")] forState:UIControlStateNormal];
    
}

-(void)clickLogin{
    
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    switch (textField.tag) {
        case kTagName:
            imgName.image=[UIImage imageNamed:@"input_txt_bg_hl"];
            imgPwd.image=[UIImage imageNamed:@"input_pwd_bg"];
            imgPwd2.image=[UIImage imageNamed:@"input_pwd_bg"];
            break;
        case kTagPassword:
            imgName.image=[UIImage imageNamed:@"input_txt_bg"];
            imgPwd.image=[UIImage imageNamed:@"input_pwd_bg_hl"];
            imgPwd2.image=[UIImage imageNamed:@"input_pwd_bg"];
            break;
        case kTagPassword2:
            imgName.image=[UIImage imageNamed:@"input_txt_bg"];
            imgPwd.image=[UIImage imageNamed:@"input_pwd_bg"];
            imgPwd2.image=[UIImage imageNamed:@"input_pwd_bg_hl"];
            break;
    }
    return YES;
}
@end
