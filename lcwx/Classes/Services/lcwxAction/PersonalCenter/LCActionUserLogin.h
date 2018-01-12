//
//  LCActionUserLogin.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"

@interface LCActionUserLogin : HIActionPostBase
-(id) initWithAccount:(NSString *)account Pwd:(NSString *)pwd;
@end
