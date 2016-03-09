#WKProgressHUD
一行代码实现提示消息。

最轻巧，使用最简单的HUD。

##效果图
![()](http://7xneqd.com1.z0.glb.clouddn.com/hudwithtext.png)
![()](http://7xneqd.com1.z0.glb.clouddn.com/hudwithouttext.png)
![()](http://7xneqd.com1.z0.glb.clouddn.com/messagehud.png)

##使用方法
**pod 'WKProgressHUD'**

或下载源码并把"WKProgressHUD"目录拖拽到项目中。

![()](http://7xneqd.com1.z0.glb.clouddn.com/hudwithtext.png)

	[WKProgressHUD showInView:self.view withText:@"加载中" animated:YES];

![()](http://7xneqd.com1.z0.glb.clouddn.com/hudwithouttext.png)

	[WKProgressHUD showInView:self.view withText:@"" animated:YES];

![()](http://7xneqd.com1.z0.glb.clouddn.com/messagehud.png)

    [WKProgressHUD popMessage:@"网络异常" inView:self.view duration:1.5 animated:YES];

###取消显示：

```
// 取消view中的HUD
+ (void)dismissInView:(UIView *)view animated:(BOOL)animated;
// 取消所有HUD
+ (void)dismissAll:(BOOL)animated;
// 取消显示
- (void)dismiss:(BOOL)animated;
```