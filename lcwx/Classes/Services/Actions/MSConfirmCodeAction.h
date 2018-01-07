//
//  MSConfirmCodeAction.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"

@interface MSConfirmCodeAction : HIActionPostBase
-(id) initWithPhoneNumber:(NSString *) phone_number andTemplate_id:(NSString *)template_id;
@end
