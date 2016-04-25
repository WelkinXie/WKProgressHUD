//
//  WKProgressHUD.h
//  WKProgressHUD
//
//  Created by Welkin Xie on 3/8/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WKProgressHUD
//

#import <UIKit/UIKit.h>

@interface WKProgressHUD : UIView
@property (nonatomic, weak) UIView *view;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, copy) NSString *text;

// 等待中
+ (instancetype)showInView:(UIView *)view withText:(NSString *)text animated:(BOOL)animated;

// 提示消息
+ (instancetype)popMessage:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;

// 取消view中的HUD
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;

// 取消所有HUD
+ (void)dismissAll:(BOOL)animated;

// 取消
- (void)dismiss:(BOOL)animated;

- (void)addIndicator;
- (void)addText;
- (void)compositeElements;

@end
