//
//  MSStoreService.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSStoreService.h"
#import <UICKeyChainStore.h>

#define  KCFBundleName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define  KCFBundleShortVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation MSStoreService


+ (instancetype)sharedStoreService{
    static dispatch_once_t once_t;
    static MSStoreService *storeService = nil;
    dispatch_once(&once_t, ^{
        storeService = [[MSStoreService alloc]init];
    });
    return storeService;
}
- (BOOL)saveAccount:(NSString *)account  Password:(NSString *)password{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    if (![keychain setString:account forKey:(__bridge id)kSecAttrAccount]) {
        return NO;
    }
    if (![keychain setString:password forKey:(__bridge id)kSecValueData]) {
        return NO;
    }
    return YES;
}
- (BOOL)updtePassword:(NSString *)pwd{
    
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    if (![keychain setString:pwd forKey:(__bridge id)kSecValueData]) {
        return NO;
    }
    return YES;
}
- (NSString *)Account{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    return keychain[(__bridge id)kSecAttrAccount];
}
- (NSString *)Password{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    return keychain[(__bridge id)kSecValueData];
}
- (void)removeAccount{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    keychain[(__bridge id)kSecAttrAccount] = nil;
}
- (void)removePassword{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    keychain[(__bridge id)kSecValueData] = nil;
}
- (void)removeAccountAndPassword{
    UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:KCFBundleName];
    keychain[(__bridge id)kSecAttrAccount] = nil;
    keychain[(__bridge id)kSecValueData] = nil;
}
- (void)setUid:(NSString *)uid{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:uid forKey:@"uid"];
    [def synchronize];
}
- (NSString *)uid{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *uid = [def objectForKey:@"uid"];
    return uid;
}
- (void)setToken:(NSString *)token{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:token forKey:@"token"];
    [def synchronize];
}
- (NSString *)token{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *token = [def objectForKey:@"token"];
    return token;
}
- (void)setSign:(NSString *)sign{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:sign forKey:@"sign"];
    [def synchronize];
}
- (NSString *)sign{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *sign = [def objectForKey:@"sign"];
    return sign;
}
- (void)setTimestamp:(NSString *)timestamp{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:timestamp forKey:@"timestamp"];
    [def synchronize];
}
- (NSString *)timestamp{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *timestamp = [def objectForKey:@"timestamp"];
    return timestamp;
}
- (void)setDevice_id:(NSString *)device_id{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:device_id forKey:@"device_id"];
    [def synchronize];
}
- (NSString *)device_id{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *device_id = [def objectForKey:@"device_id"];
    return device_id;
}

@end
