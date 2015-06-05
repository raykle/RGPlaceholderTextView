//
//  ViewController.m
//  RGPlaceholderTextViewDemo
//
//  Created by Ray on 15/6/5.
//  Copyright (c) 2015年 Ray. All rights reserved.
//

#import "ViewController.h"
#import "RGPlaceholderTextView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet RGPlaceholderTextView *myTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTextView.placeholder = @"This is Placeholder...";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
