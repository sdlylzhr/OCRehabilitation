//
//  LoginViewModel.h
//  OCRehabilitation
//
//  Created by lizhongren on 2018/4/3.
//  Copyright © 2018年 lizhongren. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACCommand, RACSignal;
@interface LoginViewModel : NSObject

@property(nonatomic, strong) NSString *account;
@property(nonatomic, strong) NSString *password;

@property(nonatomic, strong) RACSignal *btnEnableSignal;
@property(nonatomic, strong) RACCommand *loginCommand;

@end
