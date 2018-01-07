//
//  MSChangePasswordAction.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSChangePasswordAction : HIActionPostBase
- (id)initWithOldPwd:(NSString *)oldPWD AndNewPwd:(NSString *)newpwd;
@end
