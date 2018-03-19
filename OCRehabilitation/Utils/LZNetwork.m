//
//  LZNetwork.m
//  OCRehabilitation
//
//  Created by lizhongren on 2018/3/9.
//  Copyright © 2018年 lizhongren. All rights reserved.
//

#import "LZNetwork.h"
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>

@implementation LZNetwork

+ (void)startNet {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"application/atom+xml", @"text/xml", nil];
    ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [manager GET:@"http://localhost:8080/getall" parameters:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"请求成功: %@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
}


+ (void)uploadFile {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"application/atom+xml", @"text/xml", nil];
    ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    NSData *imgData = UIImagePNGRepresentation([UIImage imageNamed:@"000071A7.png"]);

    
//    [manager POST:url
//       parameters:@{
//                    @"key1":@"value1",
//                    @"key2":@"value2"
//                    }
//constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//    [formData appendPartWithFileData:imgData name:@"key3" fileName:@"avatar.png" mimeType:@"image/png"];
//}
//         progress:nil
//          success:^(NSURLSessionTask *task, id responseObject) {
//              NSLog(@"response:%@", responseObject);
//          }
//     }
//          failure:^(NSURLSessionTask *task, NSError *error) {
//              NSLog(@"error:%@", error);
//          }];
    
    
    [manager POST:@"http://localhost:8080/upload" parameters:@{@"pid":@4444} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:imgData name:@"myfiles" fileName:@"avatar.png" mimeType:@"image/png"];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"成功: %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误: %@", error);
    }];
    
    
    
}



@end
