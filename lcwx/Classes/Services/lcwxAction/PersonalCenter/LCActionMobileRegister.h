//
//  LCActionMobileRegister.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"

@interface LCActionMobileRegister : HIActionPostBase
-(id) initWithPhone:(NSString *)phone MobKey:(NSNumber *)mobkey Pwd:(NSString *)pwd;
@end
