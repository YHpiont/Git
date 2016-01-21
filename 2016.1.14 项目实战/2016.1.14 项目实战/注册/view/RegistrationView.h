//
//  RegistrationView.h
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/19.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationView : UIView

@property(strong,nonatomic) UITextField * nameField;//昵称
@property(strong,nonatomic) UITextField * emailField;//邮箱
@property(strong,nonatomic) UITextField * passwordField;//密码
@property(strong,nonatomic) UIButton * completeBtn;//完成按钮
@property(strong,nonatomic) UIButton * manBtn;//选择男
@property(strong,nonatomic) UIButton * femaleBtn;//选择女
@property(strong,nonatomic) UIButton * bottomBtn;//片刻协议

@end
