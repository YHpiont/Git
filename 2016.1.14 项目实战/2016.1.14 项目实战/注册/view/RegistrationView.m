//
//  RegistrationView.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/19.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "RegistrationView.h"
#import "Masonry.h"
@interface RegistrationView ()

@property(strong,nonatomic)     UILabel * nameLabel;
@property(strong,nonatomic)     UILabel * emailLabel;
@property(strong,nonatomic)     UILabel * passwordLabel;
@property(strong,nonatomic)     UILabel * lineLabel1;
@property(strong,nonatomic)     UILabel * lineLabel2;
@property(strong,nonatomic)     UILabel * lineLabel3;
@property(strong,nonatomic)     UILabel * bottomLabel;

@end

@implementation RegistrationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        [self addSubview:self.manBtn];
        [self addSubview:self.femaleBtn];
        [self addSubview:self.nameField];
        [self addSubview:self.nameLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.emailLabel];
        [self addSubview:self.emailField];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.passwordLabel];
        [self addSubview:self.passwordField];
        [self addSubview:self.lineLabel3];
        [self addSubview:self.completeBtn];
        [self addSubview:self.bottomLabel];
        [self addSubview:self.bottomBtn];
        [self layoutSubviews];
}
    return self;
}

-(UIButton * )bottomBtn{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomBtn setTitle:@"片刻协议" forState:UIControlStateNormal];
        [_bottomBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_bottomBtn setTitleColor:RGB(119, 182, 69) forState:UIControlStateNormal];
    }
    return _bottomBtn;
}

-(UILabel * )bottomLabel{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc]init];
        _bottomLabel.text = @"点击“完成”按钮，代表你已阅读并同意";
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.font  = [UIFont systemFontOfSize:12.0];
    }
    return _bottomLabel;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"昵称";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _nameLabel;
}

-(UILabel *)emailLabel{
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc]init];
        _emailLabel.text = @"邮箱";
        _emailLabel.textColor = [UIColor blackColor];
        _emailLabel.textAlignment = NSTextAlignmentCenter;
        _emailLabel.font = [UIFont systemFontOfSize:12.0];
        _emailLabel.backgroundColor = [UIColor orangeColor];
    }
    return _emailLabel;
}

-(UILabel *)passwordLabel{
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc]init];
        _passwordLabel.text = @"密码";
        _passwordLabel.textColor = [UIColor blackColor];
        _passwordLabel.textAlignment = NSTextAlignmentCenter;
        _passwordLabel.font = [UIFont systemFontOfSize:12.0];
        _passwordLabel.backgroundColor = [UIColor orangeColor];
    }
    return _passwordLabel;
}

-(UITextField *)nameField{
    if (!_nameField) {
        _nameField = [[UITextField alloc]init];
        [_nameField setSecureTextEntry:YES];
        [_nameField setBorderStyle:UITextBorderStyleNone];
        _nameField.textColor = [UIColor blackColor];
        _nameField.backgroundColor = [UIColor whiteColor];
    }
    return _nameField;
}

-(UITextField *)emailField{
    if (!_emailField) {
        _emailField = [[UITextField alloc]init];
        [_emailField setBorderStyle:UITextBorderStyleNone];
        _emailField.textColor = [UIColor blackColor];
        _emailField.backgroundColor = [UIColor whiteColor];
    }
    return _emailField;
}

-(UITextField *)passwordField{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc]init];
        [_passwordField setSecureTextEntry:YES];
        [_passwordField setBorderStyle:UITextBorderStyleNone];
        _passwordField.textColor = [UIColor blackColor];
        _passwordField.backgroundColor = [UIColor whiteColor];
    }
    return _passwordField;
}

-(UILabel *)lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor blackColor];
    }
    return _lineLabel1;
}

-(UILabel *)lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor blackColor];

    }
    return _lineLabel2;
}
-(UILabel *)lineLabel3{
    if (!_lineLabel3) {
        _lineLabel3 = [[UILabel alloc]init];
        _lineLabel3.backgroundColor = [UIColor blackColor];

    }
    return _lineLabel3;
}

-(UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _completeBtn.backgroundColor = [UIColor blueColor];
        [_completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
    return _completeBtn;
}

-(UIButton *)manBtn{
    if (!_manBtn) {
        _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_manBtn setBackgroundColor:[UIColor whiteColor]];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"male_normal.jpg"] forState:UIControlStateNormal];
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"male_select.jpg"] forState:UIControlStateHighlighted];
        _manBtn.selected = NO;
    }
    return _manBtn;
}

-(UIButton *)femaleBtn{
    if (!_femaleBtn) {
        _femaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [ _femaleBtn setBackgroundImage:[UIImage imageNamed:@"female_normal.jpg"] forState:UIControlStateNormal];
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"female_select.jpg"] forState:UIControlStateHighlighted];
        _femaleBtn.selected =NO;
    }
    return _femaleBtn;
}

-(void)layoutSubviews{
    WS(weakSelf);
    
    [_manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-50);
        make.size.equalTo(CGSizeMake(50, 25));
        make.top.equalTo(weakSelf.mas_top).offset(10);
    }];
//
//    
    [_femaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.centerX.equalTo(weakSelf.mas_centerX).offset(50);
        make.size.equalTo(CGSizeMake(50, 25));
    }];
    
   [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.top.equalTo(weakSelf.manBtn.mas_bottom).offset(50);
        make.size.equalTo(CGSizeMake(35, 13));
    }];
    [_nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(weakSelf.manBtn.mas_bottom).offset(35);
        make.height.equalTo(33);
    }];

    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameField.mas_bottom).offset(2);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];
    
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.top.equalTo(weakSelf.lineLabel1.mas_bottom).offset(30);
        make.size.equalTo(CGSizeMake(35, 13));
    }];
    
    [_emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.emailLabel.mas_right).offset(5);
        make.height.equalTo(33);
        make.top.equalTo(weakSelf.lineLabel1.mas_top).offset(20);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
    }];

    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.emailField.mas_bottom).offset(2);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];
    [_passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(30);
        make.size.equalTo(CGSizeMake(35, 13));
    }];
    
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(20);
        make.height.equalTo(33);
        
    }];
    
    [_lineLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordField.mas_bottom).offset(2);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
    }];

    [_completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(45);
        make.top.equalTo(weakSelf.lineLabel3.mas_bottom).offset(20);
    }];

    [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-50);
        make.size.equalTo(CGSizeMake(220, 15));
        make.top.equalTo(weakSelf.completeBtn.mas_bottom).offset(45);
        
    }];

    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bottomLabel.mas_right).offset(20);
        make.size.equalTo(CGSizeMake(50, 15));
        make.top.equalTo(weakSelf.completeBtn.mas_bottom).offset(45);
    }];
}



- (void)changeSexBtnMethod:(UIButton *)sender{
    if (self.manBtn.selected == NO && self.femaleBtn.selected == NO) {
        sender.selected = YES;
    }else if (sender.tag == 100){
        sender.selected = YES;
        _femaleBtn.selected = NO;
    }else if (sender.tag == 101){
        sender.selected = YES;
        _manBtn.selected = NO;
    }
}

@end
