//
//  PKLeftViewController.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/14.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftViewController.h"
#import "PKLeftHeadView.h"
#import "PKLeftTableView.h"
@interface PKLeftViewController ()

@property(strong,nonatomic)  PKLeftHeadView * leftheadView;
@property(strong,nonatomic)  PKLeftTableView * leftTable;

@end


@implementation PKLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(51, 51, 51);
    [self.view addSubview:self.leftheadView];
    WS(weakSelf);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.height.equalTo(190);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
    }];
    [self.view addSubview:self.leftheadView];
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.leftheadView.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
    }];
}
//侧边顶部信息view
- (PKLeftHeadView *)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        
    }
    return _leftheadView;
}
//中间切换视图的列表
- (PKLeftTableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:(UITableViewStylePlain)];
    }
    return _leftTable;
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
