//
//  LCActionCheckAppVersion.m
//  lcwx
//
//  Created by luck on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionCheckAppVersion.h"

@implementation LCActionCheckAppVersion
/*
 {
 "data": {
 "needUpdate": false,
 "forceUpdate": false,
 "noticeInterval": 0,
 "description": "",
 "downloadLink": ""
 },
 "Success": true,
 "Token": "b300ad040c5027bb8c42f8d5c3ce63b4,3509796,1515738162",
 "Total": 0,
 "Message": "操作成功",
 "Code": 0,
 "Version": "4.0.4"
 }
 */
-(id) init
{
    self = [super initWithActionURLString:@"/api/Sys/CheckAppVersion"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}

@end
