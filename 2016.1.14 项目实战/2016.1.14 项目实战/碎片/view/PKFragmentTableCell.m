//
//  PKFragmentTableCell.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/20.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKFragmentTableCell.h"
#import "Masonry.h"
#import "UIImageView+SDWedImage.h"

@interface PKFragmentTableCell()
@property(strong,nonatomic)     UIImageView * iconImage;//头像
@property(strong,nonatomic)     UILabel * userName;//用户名
@property(strong,nonatomic)     UILabel * timeLabel;//时间
@property(strong,nonatomic)     UILabel * contentLabel;//内容
@property(strong,nonatomic)     UIImageView *contentImage;//大图片
@property(strong,nonatomic)     UIButton * writeBtn;//评论按钮
@property(strong,nonatomic)     UILabel * writeLabel;//评论数量
@property(strong,nonatomic)     UIButton * likeBtn;//喜欢按钮
@property(strong,nonatomic)     UILabel * likeLabel;//喜欢数量
@property(strong,nonatomic)     UILabel * lineLabel;//线

@end

@implementation PKFragmentTableCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.userName];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentImage];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.writeBtn];
        [self.contentView addSubview:self.writeLabel];
        [self.contentView addSubview:self.likeBtn];
        [self.contentView addSubview:self.likeLabel];
        [self.contentView addSubview:self.lineLabel];
        
        [self addAutoLayout];
    }
    return self;
}

-(void)setCounterList:(PKFragmentList *)counterList{
    _counterList = counterList;
    [_iconImage downloadImage:counterList.userinfo.icon];
    _userName.text = counterList.userinfo.uname;
    _timeLabel.text = counterList.addtimeF;
    _likeLabel.text = [NSString stringWithFormat:@"%li",counterList.counterList.like];
    _writeLabel.text = [NSString stringWithFormat:@"%li",counterList.counterList.comment];
    //加载网络图片方法（UIImageView+SDWedImage中）
    [_contentImage downloadImage:_counterList.coverimg];
    //label调用属性字符串
    _contentLabel.attributedText =[self makeText:counterList.content];
    
    CGFloat imageHeight = [_heightDic[@"imageHeight"]floatValue];
    CGFloat textHeight = [_heightDic[@"textHeight"]floatValue];
    NSLog(@"----------%lf---------%lf",imageHeight,textHeight);
    if (imageHeight == 0) {
        _contentLabel.frame = CGRectMake(20, 70, VIEW_WIDTH -40, textHeight);
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, 0);
    }else{
        _contentImage.frame = CGRectMake(20, 70, VIEW_WIDTH-40, imageHeight);
        _contentLabel.frame = CGRectMake(20, imageHeight +80, VIEW_WIDTH-40, textHeight);
    }
}
-(void)addAutoLayout{
    WS(weakSelf);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(30, 30));
        make.left.equalTo(weakSelf.contentView.mas_left).offset(20);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(20);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(14.0);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(5);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-70);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 14));
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-20);
        make.centerY.equalTo(weakSelf.iconImage.mas_centerY);
    }];
    
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-150);
    }];
    
    [_writeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.writeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-30);
        make.left.equalTo(weakSelf.writeLabel.mas_right).offset(-30);
    }];
    
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 10));
        make.left.equalTo(weakSelf.likeBtn.mas_right).offset(10);
        make.centerY.equalTo(weakSelf.writeBtn.mas_centerY);
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentView.mas_bottom);
        make.right.equalTo(weakSelf.contentView.mas_right);
        make.left.equalTo(weakSelf.contentView.mas_left);
        make.height.equalTo(0.5);
        
    }];
}

-(UILabel * )lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineLabel;
}
-(UIImageView * )iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.layer.masksToBounds = YES;
        _iconImage.layer.cornerRadius = 15.0;
        _iconImage.backgroundColor = [UIColor lightGrayColor];
    }
    return _iconImage;
}

//生成属性字符串
-(NSAttributedString *)makeText:(NSString * )exampleString{
    //段落类型
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
    //行间距
    paragraph.lineSpacing = 10;
    //段落间距
    paragraph.paragraphSpacing = 20;
    //首行缩进
    paragraph.firstLineHeadIndent = 30;
//属性字典（[UIFont fontWithName:@"PingFangSC-Regular" size:15.0f]指定字符串使用的字体，因为iOS9中字体不是黑体是苹果体，不然在iOS9中字符高度计算容易出现错误）
    NSDictionary * dicA = @{NSFontAttributeName:[UIFont fontWithName:@"楷体_GB2312" size:15.0],
                            NSParagraphStyleAttributeName:paragraph,
                            };
    NSAttributedString * attribute = [[NSAttributedString alloc]initWithString:exampleString attributes:dicA];
    return attribute;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
