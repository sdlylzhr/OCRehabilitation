//
//  LoginViewModel.m
//  OCRehabilitation
//
//  Created by lizhongren on 2018/4/3.
//  Copyright © 2018年 lizhongren. All rights reserved.
//

#import "LoginViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    self.btnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, password)] reduce:^id (NSString *account, NSString *password){
        
        return @(account.length && (password.length > 5));
    }];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
       
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:@"请求完成"];
            
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"结束");
            }];
            
            }];
        
    }];
    
    
    [[_loginCommand.executing skip:1] subscribeNext:^(NSNumber *x) {
       
        if ([x boolValue]) {
            NSLog(@"正在执行");
        } else {
            NSLog(@"执行结束");
        }
    }];
    
}

@end
