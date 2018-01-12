//
//  LCActionUserLogin.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionUserLogin.h"

@implementation LCActionUserLogin
-(id) initWithAccount:(NSString *)account Pwd:(NSString *)pwd
{
    self = [super initWithActionURLString:@"/api/PersonalCenter/UserLogin"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:account forKey:@"account"];
        [self.parameters setObject:pwd forKey:@"pwd"];
        
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
