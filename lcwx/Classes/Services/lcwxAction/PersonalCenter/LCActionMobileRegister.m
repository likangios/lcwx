//
//  LCActionMobileRegister.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionMobileRegister.h"

@implementation LCActionMobileRegister
-(id) initWithPhone:(NSString *)phone MobKey:(NSNumber *)mobkey Pwd:(NSString *)pwd
{
    self = [super initWithActionURLString:@"/api/Sys/MobileRegister"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:phone forKey:@"mob"];
        [self.parameters setObject:mobkey forKey:@"mobkey"];
        [self.parameters setObject:pwd forKey:@"pwd"];

    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
