//
//  PKEmailLandingView.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/15.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKEmailLandingView.h"
#import "Masonry.h"
@implementation PKEmailLandingView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.tostLabel3];
        [self addSubview:self.tostLabel4];
        [self addSubview:self.dengluBtn];
        [self addSubview:self.textfield1];
        [self addSubview:self.textfield2];
        [self addLayoutIn];
    }
    return self;
}

-(void)addLayoutIn{
    
    WS(weakSelf);
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.top.equalTo(weakSelf.mas_top).offset(55);
        make.height.equalTo(0.5);
        
    }];
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.equalTo(0.5);
        make.top.equalTo(_lineLabel1.mas_bottom).offset(80);
    }];
    [_tostLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top).offset(-10);
        
    }];
    
    [_tostLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(35, 13));
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top).offset(-10);
    }];
    
    [_dengluBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineLabel2.mas_bottom).offset(25);
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.mas_equalTo(30);
    }];
    
    [_textfield1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.tostLabel3.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel1.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(weakSelf.lineLabel1.mas_top);
        
    }];
    
    [_textfield2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.tostLabel4.mas_right).offset(5);
        make.right.equalTo(weakSelf.lineLabel2.mas_right);
        make.height.equalTo(33);
        make.bottom.equalTo(weakSelf.lineLabel2.mas_top);
        
    }];
}

-(UILabel * )lineLabel1{
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc]init];
        _lineLabel1.backgroundColor = [UIColor lightGrayColor];
    }
return _lineLabel1;
}
-(UILabel* )lineLabel2{
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc]init];
        _lineLabel2.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _lineLabel2;
}
-(UILabel *)tostLabel3{
    if (!_tostLabel3) {
        _tostLabel3 = [[UILabel alloc]init];
        _tostLabel3.text = @"邮箱";
        [_tostLabel3 setTextAlignment:NSTextAlignmentCenter];
        [_tostLabel3 setTextColor:[UIColor blackColor]];
        [_tostLabel3 setFont:[UIFont systemFontOfSize:14.0]];
        
}
    return _tostLabel3;
}
-(UILabel * )tostLabel4{
    if (!_tostLabel4) {
        _tostLabel4 = [[UILabel alloc]init];
        _tostLabel4.text =@"密码";
        [_tostLabel4 setTextColor:[UIColor blackColor]];
        [_tostLabel4 setTextAlignment:NSTextAlignmentCenter];
        [_tostLabel4 setFont:[UIFont systemFontOfSize:14.0]];
    }
    return _tostLabel4;
}

-(UITextField*)textfield1{
    if (!_textfield1) {
        _textfield1 = [[UITextField alloc]init];
        _textfield1.secureTextEntry = YES;// textfield中文字以密码形式显示
        _textfield1.delegate =self;
        _textfield1.borderStyle = UITextBorderStyleNone;
    }
    return _textfield1;
}

-(UITextField*)textfield2{
    if (!_textfield2) {
        _textfield2 = [[UITextField alloc]init];
        _textfield2.secureTextEntry = YES;
        _textfield2.delegate =self;
        _textfield2.borderStyle = UITextBorderStyleNone;
    }
    return _textfield2;
}
-(UIButton* )dengluBtn{
    if (!_dengluBtn) {
        _dengluBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_dengluBtn setBackgroundColor:RGB(119, 182, 69)];
        [_dengluBtn setTitle:@"登录" forState:(UIControlStateNormal)];
//        [_dengluBtn addTarget:self action:@selector(dengluBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _dengluBtn;
}



@end
