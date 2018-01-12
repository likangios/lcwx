//
//  LCActionBookCharts.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionBookCharts.h"

@implementation LCActionBookCharts
-(id) initWithPageIndex:(NSNumber *)pageindex PageSize:(NSNumber *)pagesize Type:(NSNumber *)type Oid:(NSString *)oid
{
    self = [super initWithActionURLString:@"/api/BookStorage/BookCharts"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:pageindex forKey:@"pageindex"];
        [self.parameters setObject:pagesize forKey:@"pagesize"];
        [self.parameters setObject:type forKey:@"type"];
        [self.parameters setObject:oid forKey:@"oid"];

    }
    
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}

@end
