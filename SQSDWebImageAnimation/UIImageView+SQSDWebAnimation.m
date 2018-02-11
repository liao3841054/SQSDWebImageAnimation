//
//  UIImageView+SQSDWebAnimation.m
//  SQSDWebImageAniamtion
//
//  Created by liaoyp on 2018/2/8.
//  Copyright © 2018年 SQKB All rights reserved.
//

#import "UIImageView+SQSDWebAnimation.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation UIImageView (SQSDWebAnimation)

- (void)animationLoadImageWithUrl:(NSString *)picUrl {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl duration:(CGFloat)duration {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil duration:duration];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:kSQSDWebAnimationDefaultDuration];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:duration completion:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage completion:(void(^)(UIImage *image))completion {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:kSQSDWebAnimationDefaultDuration completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration completion:(void(^)(UIImage *image))completion {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:duration animationOperaion:SQImageAnimationOperationNotMemory completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage transition:(CATransition*)transition completion:(void(^)(UIImage *image))completion
{
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage animationOperaion:SQImageAnimationOperationNotMemory transition:transition completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl animationOperaion:(SQImageAnimationOperation)operation {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil animationOperaion:operation completion:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:kSQSDWebAnimationDefaultDuration animationOperaion:operation completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion {
    
    CATransition *transition = [self sq_defaultAnimationWithDuration:duration > 0 ? duration: kSQSDWebAnimationDefaultDuration];
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage animationOperaion:operation transition:transition completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation transition:(CATransition*)transition completion:(void(^)(UIImage *image))completion{
    
    NSAssert(transition, @"animationLoadImageWithUrl transition not nil");
    
    __weak typeof(self) _self = self;
    [self sd_setImageWithURL:(NSURL *)picUrl placeholderImage:holderImage options:SDWebImageRetryFailed | SDWebImageAvoidAutoSetImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        __strong typeof(_self) self = _self;
        if (image.images.count > 0) {
            // 这是的Animation Gif图片
            self.animationImages = image.images;
            self.animationDuration = image.duration;
            self.image = image;
            if (completion) {
                completion(image.images.firstObject);
            }
        }
        else {
            if (image) {
                if ([self animationWithOperation:operation cacheType:cacheType]) {
                    [self.layer addAnimation:transition forKey:@"image_fade"];
                }
                self.image = image;
            }
            else {
                self.image = holderImage;
            }
            
            if (completion) {
                completion(self.image);
            }
        }
    }];
}

- (BOOL)animationWithOperation:(SQImageAnimationOperation)operation cacheType:(SDImageCacheType)cacheType {
    BOOL animation = NO;
    if (operation == SQImageAnimationOperationAlways) {
        animation = YES;
    }
    else if (operation == SQImageAnimationOperationOnlyDownload) {
        animation = cacheType == SDImageCacheTypeNone;
    }
    else if (operation == SQImageAnimationOperationNotMemory) {
        animation = cacheType != SDImageCacheTypeMemory;
    }
    return animation;
}

- (CATransition *)sq_defaultAnimationWithDuration:(CGFloat)duration {
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    return transition;
}


@end
