//
//  PKFragmentTableCell.h
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/20.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKFragmentModel.h"
@interface PKFragmentTableCell : UITableViewCell
@property(strong,nonatomic)         PKFragmentList * counterList;
@property(strong,nonatomic)         NSDictionary * heightDic;

@end
