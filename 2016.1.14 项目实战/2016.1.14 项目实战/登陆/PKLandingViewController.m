//
//  PKLandingViewController.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/15.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLandingViewController.h"
#import "PKThirdLandingView.h"//第三方登录view
#import "PKEmailLandingView.h"//邮箱正常登陆
#import "RegistratViewController.h" //
#import "Masonry.h"
@interface PKLandingViewController ()<UITextFieldDelegate>

@property(strong,nonatomic) UIButton * backBtn;
@property(strong,nonatomic) UIButton * registerBtn;
@property(strong,nonatomic) UIImageView  * titleImage;
@property(strong,nonatomic)PKEmailLandingView * emailLandingView;
@property(strong,nonatomic)PKThirdLandingView * thirdLandingView;

@end

@implementation PKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self  setAUtoLayout];
    
    [self.view addSubview:self.thirdLandingView];
    WS(weakSelf);
    [_thirdLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.equalTo(105);
    }];
    
    [self.view addSubview:self.emailLandingView];
    [_emailLandingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.thirdLandingView.mas_top).offset(-50);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.height.equalTo(250);
    }];
}
//底部第三方登录view
- (PKThirdLandingView *)thirdLandingView{
    if (!_thirdLandingView) {
        _thirdLandingView = [[PKThirdLandingView alloc]init];
        
    }
    return _thirdLandingView;
}
- (PKEmailLandingView *)emailLandingView{
    if (!_emailLandingView) {
        _emailLandingView = [[PKEmailLandingView alloc]init];
        _emailLandingView.textfield1.delegate =self;
        _emailLandingView.textfield2.delegate =self;
        
    }
    return _emailLandingView;
}

-(void)createUI{
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(backbtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_backBtn];
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_registerBtn setTitleColor:RGB(122, 122, 122) forState:UIControlStateNormal];
    
    [_registerBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_registerBtn addTarget:self action:@selector(registrAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_registerBtn];
    
    _titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"片刻LOGO"]];
    [self.view addSubview:_titleImage];
    
}

-(void)setAUtoLayout{
    WS(weakSelf);
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).offset(15);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
        make.size.equalTo(CGSizeMake(15, 15));
        
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-15);
        make.top.equalTo(weakSelf.view.mas_top).offset(40);
        make.size.equalTo(CGSizeMake(70, 25));
        
    }];
    
    [_titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        
    }];
     }
-(void)backbtnAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [_emailLandingView.textfield1 resignFirstResponder];
    [_emailLandingView.textfield2 resignFirstResponder];
    WS(weakSelf);
    if (textField ==_emailLandingView.textfield1 ) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 50;
            weakSelf.view.bounds = rect;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = weakSelf.view.bounds;
            rect.origin.y = 100;
            weakSelf.view.bounds = rect;
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_emailLandingView.textfield1 resignFirstResponder];
    [_emailLandingView.textfield2 resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_emailLandingView.textfield1 resignFirstResponder];
    [_emailLandingView.textfield2 resignFirstResponder];
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    
}

-(void)registrAction{
   RegistratViewController * registrx = [[RegistratViewController alloc]init];
    [self presentViewController:registrx animated:YES completion:nil];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
