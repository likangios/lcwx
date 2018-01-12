//
//  LCActionAdd.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionAdd.h"
/*
 {
 "Success": true,
 "Token": "694c4f5e9e54f5f5d9dd3fed633efd7d,3509796,1515738733",
 "Total": 0,
 "Message": "操作成功",
 "Code": 0,
 "Version": "4.0.4"
 }
 */
@implementation LCActionAdd
-(id) initWithBid:(NSString *)bid
{
    self = [super initWithActionURLString:@"/api/BookCase/Add"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:bid forKey:@"bid"];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}

@end
