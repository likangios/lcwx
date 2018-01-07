//
//  MSSignupWithPhoneAction.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSSignupWithPhoneAction : HIActionPostBase
-(id) initWithPhoneNumber:(NSString *) phone_number
              ConfirmCode:(NSString *) confirm_code Password:(NSString *)pwd;
@end
