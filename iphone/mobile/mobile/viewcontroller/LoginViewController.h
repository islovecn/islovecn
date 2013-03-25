//
//  LoginViewController.h
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    UIImageView *imgName;
    UIImageView *imgPwd;
    BOOL showPassword;
    UIButton *btnCK;
    UITextField *txtPwd; 
    UITextField *txtName;
}
@end
