//
//  PKLeftMusicView.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/15.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftMusicView.h"
#import "Masonry.h"
@implementation PKLeftMusicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicFrom];
        [self addSubview: self.musicName];
        [self addSubview:self.startBtn];
    }
    return self;
}

-(void)layoutSubviews{
    WS(weakSelf);
    
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right);
        make.left.equalTo(weakSelf.mas_left);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.mas_left).offset(20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.equalTo(weakSelf.mas_bottom).offset(10);
        make.top.equalTo(_musicName.mas_bottom).offset(15);
        make.height.equalTo(@14);
        
    }];
    
    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.equalTo(weakSelf.mas_bottom).offset(10);
        make.left.equalTo(_musicImage.mas_right).offset(20);
        make.top.equalTo(weakSelf.mas_top).offset(20);
        
    }];
    
}


-(UIImageView * ) musicImage{
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐"]];
        
    }
    return  _musicImage;
}

-(UILabel *)musicName{
    if (!_musicName) {
        _musicName = [[UILabel alloc] init];
        _musicName.textAlignment = NSTextAlignmentCenter;
        
    }
    return _musicName;
}

-(UILabel * )musicFrom{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.textColor = [UIColor whiteColor];
    }
    return _musicFrom;
}


-(UIButton * )startBtn{
    if (!_startBtn) {
        _startBtn  = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:(UIControlStateNormal)];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:(UIControlStateNormal)];
        
    }
    return _startBtn;
}

-(UIButton*)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _backBtn.backgroundColor = RGB(28, 28, 28);
    }
    return _backBtn;
}





@end
