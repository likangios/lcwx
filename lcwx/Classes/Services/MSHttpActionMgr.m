//
//  MSHttpActionMgr.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSHttpActionMgr.h"

@interface MSHttpActionMgr ()

@property (nonatomic,strong)AFHTTPSessionManager *httpRequestMgr;

@end

static MSHttpActionMgr *shareMgr = nil;


@implementation MSHttpActionMgr

- (NSString *)getBaseUrlString{
    NSString *host_url = host;
    return host_url;
}

+(id)shared{
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        shareMgr = [[MSHttpActionMgr alloc]init];
        
        NSURL *base_url = [NSURL URLWithString:[shareMgr getBaseUrlString]];
        AFHTTPSessionManager *manager =[[AFHTTPSessionManager alloc]initWithBaseURL:base_url];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        shareMgr.httpRequestMgr = manager;
        
    });
    return shareMgr;
}
- (AFHTTPSessionManager *)getHttpRequestMgr{
    shareMgr.httpRequestMgr.securityPolicy.allowInvalidCertificates = NO;
    return shareMgr.httpRequestMgr;
}

- (AFHTTPSessionManager *)getHttpsRequestMgr{
    shareMgr.httpRequestMgr.securityPolicy.allowInvalidCertificates = YES;
    return shareMgr.httpRequestMgr;
}
-(void) ClearCookies
{
    NSURL * base_url = [NSURL URLWithString:[shareMgr getBaseUrlString]];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: base_url];
    for (NSHTTPCookie *cookie in cookies)
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}
@end
