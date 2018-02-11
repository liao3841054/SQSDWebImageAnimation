//
//  UIImageView+SQSDWebAnimation.h
//  SQSDWebImageAniamtion
//
//  Created by liaoyp on 2018/2/8.
//  Copyright © 2018年 SQKB All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQSDWebImageAnimationConst.h"

@interface UIImageView (SQSDWebAnimation)

#pragma mark - Default

- (void)animationLoadImageWithUrl:(NSString *)picUrl ;

- (void)animationLoadImageWithUrl:(NSString *)picUrl duration:(CGFloat)duration;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage completion:(void(^)(UIImage *image))completion;

/**
 图片加载动画，当图片资源是来自下载或者从本地加载完成，展示动画
 
 @param picUrl  图片链接
 @param holderImage 占位图
 @param duration 动画时长；Default 5.6
 @param completion 加载完成回调
 */
- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration completion:(void(^)(UIImage *image))completion;

#pragma mark - Animation Operaion

- (void)animationLoadImageWithUrl:(NSString *)picUrl animationOperaion:(SQImageAnimationOperation)operation;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion;

/**
 图片加载动画，当图片资源是来自下载或者从本地加载完成，展示动画
 
 @param picUrl  图片链接
 @param holderImage 占位图
 @param operation 动画配置属性
 @param transition 自定义动画
 @param completion 加载完成回调
 */
- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation transition:(CATransition*)transition completion:(void(^)(UIImage *image))completion;


@end
