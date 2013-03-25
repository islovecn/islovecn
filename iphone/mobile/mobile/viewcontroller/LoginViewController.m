//
//  LoginViewController.m
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import "LoginViewController.h"
#define kTagName               100
#define kTagPassword           101

@interface LoginViewController ()

@end

@implementation LoginViewController
 

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
    topBarName.image=[UIImage imageNamed:@"login_txt"];
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
    [btnReg setImage:[UIImage imageNamed:@"top_reg_but"] forState:UIControlStateNormal];
    [btnReg setImage:[UIImage imageNamed:@"top_reg_but_hover"] forState:UIControlStateHighlighted];
    [btnReg addTarget:self action:@selector(gotoReg) forControlEvents:UIControlEventTouchUpInside];
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
    
    btnCK=[UIButton buttonWithType:UIButtonTypeCustom];
    btnCK.frame=CGRectMake(20, 161, 30, 30);
    [btnCK setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal]; 
    [btnCK addTarget:self action:@selector(clickCheck) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* lblpwd=[[UILabel alloc] initWithFrame:CGRectMake(53, 166, 80, 20)];
    lblpwd.text=@"显示密码";
    lblpwd.textColor=[UIColor grayColor];
    lblpwd.font=[UIFont systemFontOfSize:18.0];
    
    UIButton* btnLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    btnLogin.frame=CGRectMake(kDeviceWidth-165, 156, 140, 40);
    [btnLogin setImage:[UIImage imageNamed:@"login_but"] forState:UIControlStateNormal];
    [btnLogin setImage:[UIImage imageNamed:@"login_but_hover"] forState:UIControlStateHighlighted];
    [btnLogin addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imgName];
    [self.view addSubview:imgPwd];
    [self.view addSubview:btnCK];
    [self.view addSubview:lblpwd];
    [self.view addSubview:btnLogin];
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

-(void)gotoReg{
    RegistViewController* controller=[[RegistViewController alloc] init];
    [[self navigationController] pushViewController:controller animated:YES];
    [controller release];
}

-(void)clickCheck{ 
    showPassword=!showPassword;
    
    txtPwd.enabled = NO;
    txtPwd.secureTextEntry = !showPassword;
    txtPwd.enabled = YES;
    
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
            break;
        case kTagPassword:
            imgName.image=[UIImage imageNamed:@"input_txt_bg"];
            imgPwd.image=[UIImage imageNamed:@"input_pwd_bg_hl"];
            break;
    }
    return YES;
}
@end
