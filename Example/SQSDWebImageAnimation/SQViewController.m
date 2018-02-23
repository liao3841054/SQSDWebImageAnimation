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
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView animationLoadImageWithUrl:@"http://p3.so.qhmsg.com/t0130f5bffc1b0f8708.jpg"];
//    @"http://p2.so.qhimgs1.com/t0166f330df9d09c87e.jpg",
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
