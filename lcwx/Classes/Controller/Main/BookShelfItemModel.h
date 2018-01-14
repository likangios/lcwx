//
//  BookShelfItemModel.h
//  lcwx
//
//  Created by luck on 2018/1/14.
//  Copyright © 2018年 luck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookShelfItemModel : NSObject

@property(nonatomic,strong) NSString *tclass;
@property(nonatomic,strong) NSString *cover;
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *booktitle;
@property(nonatomic,strong) NSString *lastUpdateTitle;
@property(nonatomic,strong) NSString *lastUpdate;

@property(nonatomic,assign) BOOL isVip;

@property(nonatomic,strong) NSNumber *id;
@property(nonatomic,strong) NSNumber *booklength;
@property(nonatomic,strong) NSNumber *state;
@property(nonatomic,strong) NSNumber *cid;
@property(nonatomic,strong) NSNumber *lastUpdateId;


@end
