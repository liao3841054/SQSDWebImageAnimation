//
//  CALayer+SQSDWebAnimation.h
//  SQSDWebImageAniamtion_Example
//
//  Created by liaoyp on 2018/2/8.
//  Copyright © 2018年 SQKB. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "SQSDWebImageAnimationConst.h"

@interface CALayer (SQSDWebAnimation)

- (void)animationLoadImageWithUrl:(NSString *)picUrl;

- (void)animationLoadImageWithUrl:(NSString *)picUrl duration:(CGFloat)duration;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage;

/// Animation operation methods.
- (void)animationLoadImageWithUrl:(NSString *)picUrl animationOperaion:(SQImageAnimationOperation)operation;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion;

@end
