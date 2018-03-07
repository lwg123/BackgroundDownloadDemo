//
//  AppDelegate.h
//  ios 后台下载demo
//
//  Created by weiguang on 2018/3/6.
//  Copyright © 2018年 weiguang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDownloadProgressNotification @"downloadProgressNotification"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)beginDownloadWithUrl:(NSString *)downloadURLString;
- (void)pauseDownload;
- (void)continueDownload;

@end

