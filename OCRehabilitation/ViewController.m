//
//  ViewController.m
//  OCRehabilitation
//
//  Created by lizhongren on 2018/3/9.
//  Copyright © 2018年 lizhongren. All rights reserved.
//

#import "ViewController.h"
#import "LZNetwork.h"

#import "LoginViewModel.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (nonatomic, strong) LoginViewModel *loginVM;

@end

@implementation ViewController


- (LoginViewModel *)loginVM{
    
    if (_loginVM == NULL) {
        _loginVM = [[LoginViewModel alloc]init];
    }
    return _loginVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    RAC(self.loginVM, account) = _userField.rac_textSignal;
    
    RAC(self.loginVM, password) = _pwdField.rac_textSignal;

    RAC(_loginBtn, enabled) = self.loginVM.btnEnableSignal;
    
    
    [self.loginVM.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
       
        NSLog(@"登录成功, 跳转页面");
    }];
    
    
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIControl *x) {
       
        NSLog(@"点击啦啦啦啦");
        
        [self.loginVM.loginCommand execute:@{@"account":_userField.text, @"password":_pwdField.text}];
        
    }];
    
}

- (void)xxx{
    
//    RAC(_loginBtn, enabled) = [RACSignal combineLatest:@[_userField.rac_textSignal, _pwdField.rac_textSignal] reduce:^id (NSString *account, NSString *password){
//        return @(account.length && (password.length > 5));
//    }];
    
    
    
    
    
    
    
    
}


- (void)btnAction:(UIButton *)btn {
    
    [LZNetwork uploadFile];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
