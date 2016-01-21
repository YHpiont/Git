//
//  PKThirdLandingView.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/15.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKThirdLandingView.h"
#import "Masonry.h"
@implementation PKThirdLandingView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.qqBtn];
        [self addSubview:self.renrenBtn];
        [self addSubview: self.xinlangBtn];
        [self addSubview: self.doubanBtn];
        [self addSubview:self.textLabel];
        [self addSubview:self.lineLabel];
        [self addSubview:self.lineLabe2];
        [self addlayout];
    }
    return self;
}

-(void)addlayout{
    WS(weakSelf);
    CGFloat width = (VIEW_WIDTH - 100.0 )/5.0;
    [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.doubanBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
        
    }];
    
    [_renrenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.xinlangBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
        
    }];
    
    [_doubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.renrenBtn.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(80,20));
        
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(40);
        make.right.equalTo(_textLabel.mas_left).offset(-5);
        make.height.mas_equalTo(0.5);
        make.centerY.equalTo(_textLabel.mas_centerY);
        
    }];
    
    [_lineLabe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_textLabel.mas_right).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-40);
        make.height.mas_equalTo(0.5);
        make.centerY.equalTo(_textLabel.mas_centerY);
        
    }];
    
 
}

-(UIButton * )xinlangBtn{
    if (!_xinlangBtn) {
        _xinlangBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_xinlangBtn setBackgroundImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _xinlangBtn;
}

-(UIButton * )renrenBtn{
    if (!_renrenBtn) {
        _renrenBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_renrenBtn setBackgroundImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _renrenBtn;
}

-(UIButton *)doubanBtn{
    if (!_doubanBtn) {
        _doubanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_doubanBtn setBackgroundImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _doubanBtn;
}

-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_qqBtn setBackgroundImage:[UIImage imageNamed:@"腾讯"] forState:(UIControlStateNormal)];
    }
    return _qqBtn;
}
-(UILabel* )textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"合作登陆伙伴";

        [_textLabel setTextColor:[UIColor blackColor]];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [_textLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _textLabel;
}
-(UILabel*)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
-(UILabel*)lineLabe2{
    if (!_lineLabe2) {
        _lineLabe2 = [[UILabel alloc]init];
        _lineLabe2.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabe2;
}




@end
