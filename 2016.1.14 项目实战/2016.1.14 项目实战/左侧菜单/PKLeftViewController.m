//
//  PKLeftViewController.m
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/14.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import "PKLeftViewController.h"
#import "PKLeftHeadView.h"//头部view
#import "PKLeftTableView.h"//列表选项
#import "PKLeftMusicView.h"//底部音乐播放器
#import "ZJPNavigationController.h"//导航
#import "PKLandingViewController.h"//登陆界面
#import "PKRadioViewController.h"//电台
#import "PKFragmentViewController.h"//碎片
#import "PKSettingViewController.h"//设置
#import "PKReadViewController.h"//阅读
#import "PKGoodProductsViewController.h"//良品
#import "PKCommunityViewController.h"//社区
#import "PKHomeViewController.h"//首页
@interface PKLeftViewController()<PKLeftTableViewSelectRow>
@property(strong,nonatomic)  PKLeftHeadView * leftheadView;
@property(strong,nonatomic)  PKLeftTableView * leftTable;
@property(strong,nonatomic)  PKLeftMusicView * musicView;

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
    [self.view addSubview:self.leftTable];
    [_leftTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.leftheadView.mas_bottom);
        make.right.equalTo(weakSelf.view.mas_right).offset(45);
        make.left.equalTo(weakSelf.view.mas_left);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-60);
    }];
    [self.view addSubview:self.musicView];
    [_musicView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.height.mas_equalTo(@60);
    }];
}
//侧边顶部信息view
- (PKLeftHeadView *)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        [_leftheadView.iconImageBtn addTarget:self action:@selector(pushToLandingIVewController) forControlEvents:(UIControlEventTouchUpInside)];
        [_leftheadView.userNameBtn addTarget:self action:@selector(pushToLandingIVewController) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _leftheadView;
}
//中间切换视图的列表
- (PKLeftTableView *)leftTable{
    if (!_leftTable) {
        _leftTable = [[PKLeftTableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)style:(UITableViewStylePlain)];
        _leftTable.RowDelegate =self;
    }
    return _leftTable;
}
-(PKLeftMusicView *)musicView{
    if (!_musicView) {
        _musicView = [[PKLeftMusicView alloc]init];
    }
    return _musicView;
}
//执行跳转的代理方法
-(void)selectWhichRow:(NSInteger)row{
    switch (row) {
        case 0:
        {
            PKHomeViewController * homeController = [[PKHomeViewController alloc]init];
            homeController.title = @"首页";
            ZJPNavigationController * homeNav = [[ZJPNavigationController alloc]initWithRootViewController:homeController];
            [self.sideMenuViewController setContentViewController:homeNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
        }
            break;
        case 1:{
            PKRadioViewController * radioController = [[PKRadioViewController alloc]init];
            radioController.title = @"电台";
            ZJPNavigationController * radioNav = [[ZJPNavigationController alloc]initWithRootViewController:radioController];
            [self.sideMenuViewController setContentViewController:radioNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 2:{
            PKReadViewController * readController = [[PKReadViewController alloc]init];
            readController.title = @"阅读";
            ZJPNavigationController * readNav = [[ZJPNavigationController alloc]initWithRootViewController:readController];
            [self.sideMenuViewController setContentViewController:readNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 3:{
            PKCommunityViewController * CommunityController = [[PKCommunityViewController alloc]init];
            CommunityController.title = @"社区";
            ZJPNavigationController * communityNav = [[ZJPNavigationController alloc]initWithRootViewController:CommunityController];
            [self.sideMenuViewController setContentViewController:communityNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            }
            break;
        case 4:{
            PKFragmentViewController * FragmentController = [[PKFragmentViewController alloc]init];
           FragmentController .title = @"碎片";
            ZJPNavigationController * suipianNav = [[ZJPNavigationController alloc]initWithRootViewController:FragmentController];
            [self.sideMenuViewController setContentViewController:suipianNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 5:{
            PKGoodProductsViewController * goodProductsController = [[PKGoodProductsViewController alloc]init];
            goodProductsController.title = @"良品";
            ZJPNavigationController * goodNav = [[ZJPNavigationController alloc]initWithRootViewController:goodProductsController];
            [self.sideMenuViewController setContentViewController:goodNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            }
            break;
        case 6:{
            PKSettingViewController * settingController = [[PKSettingViewController alloc]init];
            settingController.title = @"设置";
            ZJPNavigationController * settingNav = [[ZJPNavigationController alloc]initWithRootViewController:settingController];
            [self.sideMenuViewController setContentViewController:settingNav animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
            default:
            break;
    }
}



-(void)pushToLandingIVewController{
    PKLandingViewController * landing = [[PKLandingViewController alloc]init];
    [self presentViewController:landing animated:YES completion:nil];
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
