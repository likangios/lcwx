//
//  MSChangePasswordAction.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSChangePasswordAction.h"

@implementation MSChangePasswordAction

- (id)initWithOldPwd:(NSString *)oldPWD AndNewPwd:(NSString *)newpwd{
    self = [super initWithActionURLString:@""];
    if (self) {
        
        self.parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:oldPWD,@"old_password",newpwd,@"new_password", nil];
    }
    self.isValid = YES;
    return self;
}
@end
