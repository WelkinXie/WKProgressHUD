//
//  ViewController.m
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WKProgressHUD
//

#import "ViewController.h"
#import "WKProgressHUD.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)waitingHUDWIthText:(UIButton *)sender {
    WKProgressHUD *hud = [WKProgressHUD showInView:self.view withText:@"加载中" animated:YES];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud dismiss:YES];
    });
}

- (IBAction)waitingHUDWithoutText:(UIButton *)sender {
    WKProgressHUD *hud = [WKProgressHUD showInView:self.view withText:nil animated:YES];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [hud dismiss:YES];
    });
}

- (IBAction)messageHUD:(UIButton *)sender {
    [WKProgressHUD popMessage:@"网络异常" inView:self.view duration:1.5 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
