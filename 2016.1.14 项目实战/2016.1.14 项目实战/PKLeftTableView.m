//
//  PKLeftTableView.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/14.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftTableView.h"
#import "PKLeftTableViewCell.h"
@interface PKLeftTableView()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSArray * imageArray;
@property(strong,nonatomic) NSArray * titleArray;

@end

@implementation PKLeftTableView



    
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:(UITableViewStylePlain)];
    if (self) {
        self.delegate =self;
        self.dataSource=self;
        self.bounces = NO;
        NSArray *imageArray = @[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品"];
        NSArray * titleArray =@[@"首页",@"电台",@"阅读",@"社区",@"碎片",@"良品"];
        [self registerClass:[PKLeftTableViewCell class]  forCellReuseIdentifier:@"cell"];
        self.separatorStyle = NO;
        self.backgroundColor = RGB(51,51,51);
    }
    return self;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * identifier = @"cell";
    PKLeftTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.iconImage.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.titleLabel.text = _titleArray[indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
