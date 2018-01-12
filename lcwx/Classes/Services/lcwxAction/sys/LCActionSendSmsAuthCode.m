//
//  LCActionSendSmsAuthCode.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionSendSmsAuthCode.h"

@implementation LCActionSendSmsAuthCode

-(id) initWithPhone:(NSString *)phone Ptype:(NSNumber *)pType
{
    self = [super initWithActionURLString:@"/api/Sys/SendSmsAuthCode"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:phone forKey:@"mob"];
        [self.parameters setObject:pType forKey:@"ptype"];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
