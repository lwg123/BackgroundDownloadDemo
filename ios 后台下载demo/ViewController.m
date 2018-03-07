//
//  ViewController.m
//  ios 后台下载demo
//
//  Created by weiguang on 2018/3/6.
//  Copyright © 2018年 weiguang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *tagLable;

@property (nonatomic,strong) AppDelegate *appDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateDownloadProgress:) name:kDownloadProgressNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (IBAction)startDown:(id)sender {
    NSString *urlStr = @"http://dlsw.baidu.com/sw-search-sp/soft/3f/12289/Weibo.4.5.3.37575common_wbupdate.1423811415.exe";

    [self.appDelegate beginDownloadWithUrl:urlStr];
}

- (IBAction)pauseDown:(id)sender {
    [self.appDelegate pauseDownload];
}

- (IBAction)continueDown:(id)sender {
    [self.appDelegate continueDownload];
}

- (void)updateDownloadProgress:(NSNotification *)note {
    NSDictionary *userInfo = note.userInfo;
    CGFloat fProgress = [userInfo[@"progress"] floatValue];
    self.tagLable.text = [NSString stringWithFormat:@"%.2f%%",fProgress * 100];
    self.progressView.progress = fProgress;
}




@end
