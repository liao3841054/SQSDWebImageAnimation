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

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration completion:(void(^)(UIImage *image))completion;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage transition:(CATransition*)transition completion:(void(^)(UIImage *image))completion;


#pragma mark - Animation Operaion

- (void)animationLoadImageWithUrl:(NSString *)picUrl animationOperaion:(SQImageAnimationOperation)operation;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion;

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation transition:(CATransition*)transition completion:(void(^)(UIImage *image))completion;


@end
