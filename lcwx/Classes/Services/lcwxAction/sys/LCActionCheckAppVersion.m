//
//  LCActionCheckAppVersion.m
//  lcwx
//
//  Created by luck on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionCheckAppVersion.h"

@implementation LCActionCheckAppVersion

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
