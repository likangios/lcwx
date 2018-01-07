//
//  MSStoreService.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用来管理 账号和密码 单利
 */
@interface MSStoreService : NSObject
+ (instancetype)sharedStoreService;
/**
 *  保存账号 密码
 *
 *  @param account  账号
 *  @param password 密码
 *
 *  @return 保存成功 YES  否则 NO
 */
- (BOOL)saveAccount:(NSString *)account  Password:(NSString *)password;
/**
 *  更新用户密码  修改密码的时候 使用
 *
 *  @param pwd 密码
 *
 *  @return 成功 YES  否则 NO
 */
- (BOOL)updtePassword:(NSString *)pwd;
/**
 *  获取 保存的账号
 *
 */
- (NSString *)Account;
/**
 *  获取保存的密码
 *
 *  @return 密码
 */
- (NSString *)Password;
/**
 *  清除账号
 */
- (void)removeAccount;
/**
 *  清除密码
 */
- (void)removePassword;
/**
 *  清除账号密码
 */
- (void)removeAccountAndPassword;

@end
