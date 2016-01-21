//
//  PKFragmentModel.h
//  2016.1.14 项目实战
//
//  Created by ma c on 16/1/20.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>
//请求成功的第一层数据
@interface PKFragmentData : NSObject

@property(strong,nonatomic) NSArray * list;
@property(strong,nonatomic) NSObject * tagOffical;
@property(assign,nonatomic) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary * )dictionary;

@end

//成功后返回的数据
@interface PKFragmentModel : NSObject

@property(strong,nonatomic) PKFragmentData * data;
@property(assign,nonatomic) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

//收藏数和喜欢数
@interface PKFragmentCounterList : NSObject
@property(assign,nonatomic) NSInteger comment;
@property(assign,nonatomic) NSInteger like;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface PKFragmentTagInfo : NSObject

@property(assign,nonatomic) NSInteger count;
@property(assign,nonatomic) BOOL offical;
@property(assign,nonatomic) NSString * tag;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


//发布碎片的用户Id，名字，图标
@interface PKFragmentUserinfo : NSObject

@property(strong,nonatomic) NSString * icon;;
@property(assign,nonatomic) NSInteger uid;
@property(strong,nonatomic) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *) dictionary;

@end

//碎片描述信息，如图片大小
@interface PKFragmentList : NSObject

@property(assign,nonatomic) NSInteger addtime;
@property(strong,nonatomic) NSString * addtimeF;
@property(strong,nonatomic) NSString * content;
@property(strong,nonatomic) NSString * contentid;
@property(strong,nonatomic) PKFragmentCounterList * counterList;
@property(strong,nonatomic) NSString * coverimg;//图片路劲
@property(strong,nonatomic) NSString * coverimagWh;//图片尺寸
@property(assign,nonatomic) BOOL islike;//是否喜欢
@property(strong,nonatomic) NSString * songid;
@property(strong,nonatomic) PKFragmentTagInfo * tagInfo;
@property(strong,nonatomic) PKFragmentUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end






