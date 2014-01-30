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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    CGRect rect = CGRectMake((CGRectGetWidth(self.view.bounds) - 100)/2, (CGRectGetHeight(self.view.bounds) - 100)/2, 100, 100);
    RMDownloadIndicator *downloadIndicator = [[RMDownloadIndicator alloc]initWithFrame:rect type:kRMClosedIndicator];
    //[downloadIndicator setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:downloadIndicator];
     [downloadIndicator loadIndicator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
