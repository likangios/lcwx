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

@end
