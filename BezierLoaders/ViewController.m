//
//  ViewController.m
//  BezierLoaders
//
//  Created by Mahesh on 12/28/13.
//  Copyright (c) 2013 Mahesh. All rights reserved.
//

#import "ViewController.h"
#import "RMDownloadIndicator.h"

@interface ViewController ()

@property(nonatomic, assign)CGFloat downloadedBytes;
@property(nonatomic, weak)RMDownloadIndicator *weakIndicator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    CGRect rect = CGRectMake((CGRectGetWidth(self.view.bounds) - 100)/2, (CGRectGetHeight(self.view.bounds) - 100)/2, 100, 100);
    RMDownloadIndicator *downloadIndicator = [[RMDownloadIndicator alloc]initWithFrame:rect type:kRMClosedIndicator];
    [downloadIndicator setBackgroundColor:[UIColor whiteColor]];
    [downloadIndicator setFillColor:[UIColor colorWithRed:16./255 green:119./255 blue:234./255 alpha:1.0f]];
    [downloadIndicator setStrokeColor:[UIColor colorWithRed:16./255 green:119./255 blue:234./255 alpha:1.0f]];
    downloadIndicator.radiusPercent = 0.45;
    [self.view addSubview:downloadIndicator];
    [downloadIndicator loadIndicator];
    
    _weakIndicator = downloadIndicator;
    self.downloadedBytes = 0;
    
    double delayInSeconds = 2.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self updateView:10.0f];
    });

    double delayInSeconds1 = delayInSeconds + 2.5;
    dispatch_time_t popTime1 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds1 * NSEC_PER_SEC));
    dispatch_after(popTime1, dispatch_get_main_queue(), ^(void){
        [self updateView:30.0f];
    });
    
    double delayInSeconds2 = delayInSeconds1 + 2.5;
    dispatch_time_t popTime2 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds2 * NSEC_PER_SEC));
    dispatch_after(popTime2, dispatch_get_main_queue(), ^(void){
        [self updateView:10.0f];
    });
    
    double delayInSeconds3 = delayInSeconds2 + 2.5;
    dispatch_time_t popTime3 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds3 * NSEC_PER_SEC));
    dispatch_after(popTime3, dispatch_get_main_queue(), ^(void){
        [self updateView:50.0f];
    });
}

- (void)updateView:(CGFloat)val
{
    self.downloadedBytes+=val;
    [_weakIndicator updateWithTotalBytes:100 downloadedBytes:self.downloadedBytes];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
