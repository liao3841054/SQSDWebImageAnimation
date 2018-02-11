//
//  SQViewController.m
//  SQSDWebImageAnimation
//
//  Created by 251180323@qq.com on 02/08/2018.
//  Copyright (c) 2018 251180323@qq.com. All rights reserved.
//

#import "SQViewController.h"
#import <SQSDWebImageAnimation/UIImageView+SQSDWebAnimation.h>

@interface SQViewController ()

@end

@implementation SQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView animationLoadImageWithUrl:@""];
    [self.view addSubview:imageView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
