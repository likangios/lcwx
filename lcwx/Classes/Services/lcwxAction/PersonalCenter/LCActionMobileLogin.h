//
//  LCActionMobileLogin.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"
//手机登录
@interface LCActionMobileLogin : HIActionPostBase

-(id) initWithMob:(NSString *)mob Pwd:(NSString *)mobkey;

@end
