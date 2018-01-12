//
//  LCActionUserStatus.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionUserStatus.h"

@implementation LCActionUserStatus
-(id) init
{
    self = [super initWithActionURLString:@"/api/PersonalCenter/UserStatus"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
