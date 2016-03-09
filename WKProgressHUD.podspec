#WKProgressHUD.podspec
Pod::Spec.new do |s|
  s.name         = "WKProgressHUD"
  s.version      = "1.0"
  s.summary      = "一行代码实现提示消息。最轻巧，使用最简单的HUD。"
  s.homepage     = "https://github.com/WelkinXie/WKProgressHUD"
  s.license      = 'MIT'
  s.author       = { "Welkin Xie" => "welkin995@126.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/WelkinXie/WKProgressHUD.git", :tag => s.version}
  s.source_files  = 'WKProgressHUD/WKProgressHUD/*.{h,m}'
  s.requires_arc = true
end