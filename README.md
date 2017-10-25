# NXWebViewKit

[![CI Status](http://img.shields.io/travis/kepuna/NXWebViewKit.svg?style=flat)](https://travis-ci.org/kepuna/NXWebViewKit)
[![Version](https://img.shields.io/cocoapods/v/NXWebViewKit.svg?style=flat)](http://cocoapods.org/pods/NXWebViewKit)
[![License](https://img.shields.io/cocoapods/l/NXWebViewKit.svg?style=flat)](http://cocoapods.org/pods/NXWebViewKit)
[![Platform](https://img.shields.io/cocoapods/p/NXWebViewKit.svg?style=flat)](http://cocoapods.org/pods/NXWebViewKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NXWebViewKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NXWebViewKit'
```

## USage

**该组件**中有三种类型的`webView（ProgressWebView、LoadingWebView、AlertWebView）`。

![ProgressWebView 进度条类型](http://upload-images.jianshu.io/upload_images/2470124-85cf707e272aebe3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
 [params setValue:@"https://www.baidu.com" forKey:WebViewUrl];
    
 WebView *webView = [ProgressWebViewFactory createWebViewWithFrame:self.view.frame params:params.copy];
 [self.view addSubview:webView];

```

![LoadingWebView 加载提示符类型](http://upload-images.jianshu.io/upload_images/2470124-9f6c699eb7102463.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
 NSMutableDictionary *params = [NSMutableDictionary dictionary];
 [params setValue:@"https://www.baidu.com" forKey:WebViewUrl];
    
 WebView *webView = [LoadingWebViewFactory createWebViewWithFrame:self.view.frame params:params.copy];
 [self.view addSubview:webView];

```


![AlertWebView 弹框类型](http://upload-images.jianshu.io/upload_images/2470124-4c9b7fd41d5cbf92.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
NSMutableDictionary *params = [NSMutableDictionary dictionary];
[params setValue:@"https://www.baidu.com" forKey:WebViewUrl];
[params setValue:@"关于" forKey:WebViewTopTip];
[params setValue:@"我知道了" forKey:WebViewBottomTip];
[params setValue:[UIColor redColor] forKey:WebViewTopTipViewBackgroundColor];
[params setValue:[UIColor yellowColor] forKey:WebViewBottomBtnBackgroundColor];
    
 WebView *webView = [ProgressWebViewFactory createWebViewWithFrame:self.view.frame params:params.copy];
 [self.view addSubview:webView];

```


## Author

kepuna, jiajung@aliyun.com

## License

NXWebViewKit is available under the MIT license. See the LICENSE file for more info.
