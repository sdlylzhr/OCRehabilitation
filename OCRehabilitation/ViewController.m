//
//  ViewController.m
//  OCRehabilitation
//
//  Created by lizhongren on 2018/3/9.
//  Copyright © 2018年 lizhongren. All rights reserved.
//

#import "ViewController.h"
#import "LZNetwork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [LZNetwork startNet];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setFrame:CGRectMake(20, 20, 200, 200)];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

- (void)btnAction:(UIButton *)btn {
    
    [LZNetwork uploadFile];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
