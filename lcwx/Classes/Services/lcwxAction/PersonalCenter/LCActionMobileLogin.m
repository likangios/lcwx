//
//  LCActionMobileLogin.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionMobileLogin.h"

@implementation LCActionMobileLogin
-(id) initWithMob:(NSString *)mob Pwd:(NSString *)mobkey
{
    self = [super initWithActionURLString:@"/api/PersonalCenter/MobileLogin"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:mob forKey:@"mob"];
        [self.parameters setObject:mobkey forKey:@"mobkey"];
        
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
