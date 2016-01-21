//
//  PKEmailLandingView.h
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/15.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKEmailLandingView : UIView<UITextFieldDelegate>
@property(strong,nonatomic) UILabel * lineLabel1;
@property(strong,nonatomic) UILabel * lineLabel2;
@property(strong,nonatomic) UILabel * tostLabel3;
@property(strong,nonatomic) UILabel * tostLabel4;
@property(strong,nonatomic) UIButton * dengluBtn;
@property(strong,nonatomic) UITextField * textfield1;
@property(strong,nonatomic) UITextField * textfield2;

@end
