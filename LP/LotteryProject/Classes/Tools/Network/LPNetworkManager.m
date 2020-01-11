//
//  LPNetworkManager.m
//  LotteryProject
//
//  Created by avazuholding on 2017/12/14.
//  Copyright © 2017年 Lottery. All rights reserved.
//

#import "LPNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
@interface LPNetworkManager()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;
@property (nonatomic, strong) NSMutableArray *requestKeysArr;
@end
@implementation LPNetworkManager
+ (instancetype)sharedManager
{
    static LPNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LPNetworkManager alloc] init];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        manager.requestKeysArr = [NSMutableArray array];
        manager.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        manager.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    });
    return manager;
}
- (BOOL)checkNetwork
{
    BOOL isReachable = [self.reachabilityManager networkReachabilityStatus] != AFNetworkReachabilityStatusNotReachable;
    return isReachable;
}
- (NSURL *)urlForPath:(NSString *)path
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"",@"",path]];
    return nil;
}

- (NSMutableURLRequest *)requestForPath:(NSString *)path
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[self urlForPath:path]];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    return request;
}
- (NSError *)makeNetworkCanNotReachabileError
{
    return [NSError errorWithDomain:LP_ERROR_DOMAIN
                               code:LP_ERROR_CODE_NETWORK_NOT_REACHABLE
                           userInfo:@{LP_ERROR_USER_INFO_DESCRIPTION:@"无法访问网络"}];
}

- (RACSignal *) post:(NSString *)path
           parameter:(NSDictionary *)parameter
        showProgress:(BOOL)show
{
    if (path == nil) {
        return nil;
    }
    
    NSString *key = [path copy];
    if (parameter != nil) {
        key = [path stringByAppendingString:[[parameter mj_JSONData] base64EncodedStringWithOptions:0]];
    }
    
    if ([self.requestKeysArr containsObject:key]) {
        return nil;
    }
    [self.requestKeysArr addObject:key];
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        if (![self checkNetwork]) {
            [self.requestKeysArr removeObject:key];
            [subscriber sendError:[self makeNetworkCanNotReachabileError]];
            return  nil;
        }
        if (show) {
            [SVProgressHUD show];
        }
        __block NSURLSessionDataTask *task;
        
        NSMutableURLRequest *request = [self requestForPath:path];
        //            request.HTTPBody = [self makeRequestDataWithParameter:parameter token:[x.body objectForKey:@"token"]];
        request.timeoutInterval = 30.0f;
        //            OPGNM_YLOG(@"请求\n%@\n参数\n%@",request.URL,[request.HTTPBody mj_JSONObject]);
        task = [self.manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            [self.requestKeysArr removeObject:key];
            [SVProgressHUD dismiss];
            if (error) {
                //                    OPGNM_YLOG(@"请求\n%@\n参数\n%@\n错误\n%@",task.originalRequest.URL,[task.originalRequest.HTTPBody mj_JSONObject],error);
                [subscriber sendError:error];
            }else{
                //                    OPGNM_YLOG(@"请求\n%@\n参数\n%@\n结果\n%@",task.originalRequest.URL,[task.originalRequest.HTTPBody mj_JSONObject],responseObject);
                //                    OPGNetworkingResponse *response = [OPGNetworkingResponse mj_objectWithKeyValues:responseObject];
                //                    if (self.responseFilter && !self.responseFilter(response)) {
                //
                //                    }
                [subscriber sendNext: response];
                [subscriber sendCompleted];
            }
        }];
        [task resume];
        
        return  [RACDisposable disposableWithBlock:^{
            [self.requestKeysArr removeObject:key];
            if (task.state == NSURLSessionTaskStateSuspended || task.state == NSURLSessionTaskStateRunning) {
                [task cancel];
            }
        }];
    }];
}
@end
