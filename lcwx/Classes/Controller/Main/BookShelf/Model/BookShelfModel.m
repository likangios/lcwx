//
//  BookShelfModel.m
//  lcwx
//
//  Created by luck on 2018/1/14.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "BookShelfModel.h"

@implementation BookShelfModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"hot":@"BookShelfHotModel",
             @"item":@"BookShelfItemModel"
             };
}
@end
