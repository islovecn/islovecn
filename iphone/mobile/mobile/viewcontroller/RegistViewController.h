//
//  RegistViewController.h
//  mobile
//
//  Created by Rain on 13-3-20.
//  Copyright (c) 2013年 com.inlove. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface RegistViewController : UIViewController<UITextFieldDelegate>
{
    UIImageView *imgName;
    UIImageView *imgPwd;
    UIImageView *imgPwd2;
    BOOL showPassword;
    UIButton *btnCK;
    UITextField *txtPwd;
    UITextField *txtPwd2;
    UITextField *txtName;
}
@end
