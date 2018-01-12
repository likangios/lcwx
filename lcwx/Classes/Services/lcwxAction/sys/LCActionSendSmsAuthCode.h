//
//  LCActionSendSmsAuthCode.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"

@interface LCActionSendSmsAuthCode : HIActionPostBase
// ptype  注册：1  找回密码：3 验证码快速登录：4
-(id) initWithPhone:(NSString *)phone Ptype:(NSNumber *)pType;
@end
