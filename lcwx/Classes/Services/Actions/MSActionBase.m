//
//  MSActionBase.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "MSActionBase.h"
#import "MSUntil.h"
#import "MSStoreService.h"
@interface MSActionBase ()

@property (nonatomic,strong) NSString *url;

@end


@implementation MSActionBase


- (id)initWithActionURLString:(NSString *)str_url{
    self = [super init];
    if (self) {
        self.url = str_url;
        self.isValid = NO;
    }
    return self;
}
- (NSString *)get_action_url{
    return  self.url;
}
- (void)addBaseParameters{
    
    [self.parameters setValue:@"4.0.4" forKey:@"app_version"];
    [self.parameters setValue:@"1" forKey:@"channel_id"];
    [self.parameters setValue:@"IOS" forKey:@"platform"];
    
    [self.parameters setValue:[MSStoreService sharedStoreService].device_id forKey:@"device_id"];
    [self.parameters setValue:[MSStoreService sharedStoreService].sign forKey:@"sign"];
    [self.parameters setValue:[MSStoreService sharedStoreService].timestamp forKey:@"timestamp"];
    [self.parameters setValue:[MSStoreService sharedStoreService].token forKey:@"token"];
    [self.parameters setValue:[MSStoreService sharedStoreService].uid forKey:@"uid"];

}

- (BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    
    return NO;
    
}

@end

@implementation HIActionGetBase

-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    AFHTTPSessionManager *manager = [[MSHttpActionMgr shared] getHttpRequestMgr];
    if (!self.isValid) {
        DDLogDebug(@"self.isValid is NO");
        return NO;
    }
    if (!manager) {
        return NO;
    }
    [manager GET:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
        success(self,responseObject,task);
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        failure(self,error,task);
    }];
    return YES;
}

@end
@implementation HIActionPostBase


-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure
{
    AFHTTPSessionManager *manager = [[MSHttpActionMgr shared] getHttpRequestMgr];
    if (!self.isValid) {
        DDLogDebug(@"self.isValid is NO");
        return NO;
    }
    if (!manager) {
        return NO;
    }
    [manager POST:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(self,error,task);
    }];
    
    return YES;
}

@end

@implementation HIActionDeleteBase

-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    AFHTTPSessionManager *manager = [[MSHttpActionMgr shared] getHttpRequestMgr];
    if (!self.isValid) {
        DDLogDebug(@"self.isValid is NO");
        return NO;
    }
    if (!manager) {
        return NO;
    }
    [manager DELETE:self.url parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject,task);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(self,error,task);
        
        
    }];
    
    return YES;
}

@end
@implementation HIActionPostWithSingleImageBase

-(id) initWithActionURLString:(NSString *) str_url
{
    self = [super initWithActionURLString:str_url];
    if( self )
    {
        self.upload_image_max_size = CGSizeZero;
        
        self.upload_image_param_name = @"photo";
    }
    return self;
}

- (BOOL) DoActionWithSuccess:(ActionSuccessBlock) success Failure:(ActionFailureBlock) failure
{
    if (!self.isValid) {
        DDLogDebug(@"self.isValid is NO");
        return NO;
    }
    AFHTTPSessionManager *manager = [[MSHttpActionMgr shared] getHttpRequestMgr];
    if( !manager )
        return NO;
    
    NSURL * upload_file_url = nil;
    if( self.upload_image )
    {
        //        图片大小限制
        if( CGSizeEqualToSize(self.upload_image_max_size, CGSizeZero) )
            
        {
            upload_file_url = [MSUntil createTempImageUploadFile:self.upload_image];
        }
        else
        {
            upload_file_url = [MSUntil createTempImageUploadFile:self.upload_image WithMaxSize:self.upload_image_max_size];
        }
    }
    [manager POST:self.get_action_url parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if( upload_file_url )
        {
            [formData appendPartWithFileURL:upload_file_url name:self.upload_image_param_name error:nil];
            
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if( upload_file_url )
        {
            [[NSFileManager defaultManager] removeItemAtURL:upload_file_url error:nil];
        }
        success( self , responseObject , task );
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if( upload_file_url )
        {
            [[NSFileManager defaultManager] removeItemAtURL:upload_file_url error:nil];
        }
        
        failure( self , error , task );
    }];
    
    return YES;
}

@end


















