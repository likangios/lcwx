//
//  LCActionSearch.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionSearch.h"

@implementation LCActionSearch
-(id) initWithPageIndex:(NSNumber *)pageindex PageSize:(NSNumber *)pagesize Content:(NSString *)content
{
    self = [super initWithActionURLString:@"/api/BookStorage/Search"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:pageindex forKey:@"pageindex"];
        [self.parameters setObject:pagesize forKey:@"pagesize"];
        [self.parameters setObject:content forKey:@"content"];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
