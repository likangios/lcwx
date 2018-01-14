//
//  BookShelfHotModel.h
//  lcwx
//
//  Created by luck on 2018/1/14.
//  Copyright © 2018年 luck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookShelfHotModel : NSObject
@property(nonatomic,strong) NSString *readTxt;
@property(nonatomic,strong) NSString *readLable;
@property(nonatomic,strong) NSString *batch;
@property(nonatomic,strong) NSString *tclass;
@property(nonatomic,strong) NSString *booktitle;
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *cover;
@property(nonatomic,strong) NSString *updateTitle;
@property(nonatomic,strong) NSString *updateTime;
@property(nonatomic,strong) NSString *vipUpdateTitle;
@property(nonatomic,strong) NSString *vipUpdateTime;
@property(nonatomic,strong) NSString *lastUpdate;
@property(nonatomic,strong) NSString *Introduction;
@property(nonatomic,strong) NSString *lastUpdateTitle;

@property(nonatomic,strong) NSNumber *id;
@property(nonatomic,strong) NSNumber *booklength;
@property(nonatomic,strong) NSNumber *state;
@end
