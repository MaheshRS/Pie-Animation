//
//  ViewController.m
//  BezierLoaders
//
//  Created by Mahesh on 12/28/13.
//  Copyright (c) 2013 Mahesh. All rights reserved.
//

#import "ViewController.h"
#import "BezierRoundLoader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BezierRoundLoader *roundLoader = [[BezierRoundLoader alloc]initWithFrame:self.view.bounds];
    [roundLoader setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:roundLoader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
