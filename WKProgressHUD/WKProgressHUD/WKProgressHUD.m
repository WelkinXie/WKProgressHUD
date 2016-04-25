//
//  WKProgressHUD.m
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WKProgressHUD
//

#import "WKProgressHUD.h"
#import "WKMessageProgressHUD.h"
#import "WKWaitingProgressHUD.h"

static NSMutableArray *HUDs;

@interface WKProgressHUD ()

@end

@implementation WKProgressHUD

+ (void)load {
    HUDs = [NSMutableArray array];
}

+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated {
    WKProgressHUD *HUD = [[WKWaitingProgressHUD alloc] initWithFrame:view.bounds];
    HUD.view = view;
    HUD.text = text;
     
    [HUD addIndicator];
    [HUD addText];
    [HUD compositeElements];
    
    [HUD show:animated withDuration:0 completion:nil];
    
    return HUD;
}

+ (instancetype)popMessage:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated {
    WKProgressHUD *HUD = [[WKMessageProgressHUD alloc] initWithFrame:view.bounds];
    HUD.view = view;
    HUD.text = text;
    
    [HUD addText];
    [HUD compositeElements];
    
    [HUD show:animated withDuration:duration completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HUD dismiss:animated];
        });
    }];
    
    return HUD;
}

+ (void)dismissInView:(UIView *)view animated:(BOOL)animated {
    for (WKProgressHUD *HUD in HUDs) {
        if ([HUD.view isEqual:view]) {
            [HUD dismiss:animated];
        }
    }
}

+ (void)dismissAll:(BOOL)animated {
    for (WKProgressHUD *HUD in HUDs) {
        [HUD dismiss:animated];
    }
}

- (void)dismiss:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            for (UIView *view in self.subviews) {
                view.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [HUDs removeObject:self];
        }];
    }
    else {
        [self removeFromSuperview];
        [HUDs removeObject:self];
    }
}

- (void)show:(BOOL)animated withDuration:(NSTimeInterval)duration completion:(void (^)())completion {
    [self addSubview:self.backView];
    [HUDs addObject:self];
    
    if (animated) {
        self.alpha = 0;
        [self.view addSubview:self];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
            if (completion != NULL) {
                completion();
            }
        }];
    }
    else {
        [self.view addSubview:self];
    }
}

- (void)layoutSubviews {
    self.backView.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2, CGRectGetHeight(self.view.frame) / 2 - CGRectGetMinY(self.view.frame));
}

- (void)addIndicator {
    
}

- (void)addText {
    
}

- (void)compositeElements {
    
}

@end
