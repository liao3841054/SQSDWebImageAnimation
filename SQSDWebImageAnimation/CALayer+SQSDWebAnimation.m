//
//  CALayer+SQSDWebAnimation.m
//  SQSDWebImageAniamtion_Example
//
//  Created by liaoyp on 2018/2/8.
//  Copyright © 2018年 SQKB. All rights reserved.
//

#import "CALayer+SQSDWebAnimation.h"
#import "CALayer+SDWebCache.h"


@implementation CALayer (SQSDWebAnimation)


- (void)animationLoadImageWithUrl:(NSString *)picUrl {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl duration:(CGFloat)duration {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil duration:duration animationOperaion:SQImageAnimationOperationOnlyDownload completion:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:0.56 animationOperaion:SQImageAnimationOperationNotMemory completion:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl animationOperaion:(SQImageAnimationOperation)operation {
    [self animationLoadImageWithUrl:picUrl placeholderImage:nil animationOperaion:operation completion:nil];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion {
    [self animationLoadImageWithUrl:picUrl placeholderImage:holderImage duration:0.56 animationOperaion:operation completion:completion];
}

- (void)animationLoadImageWithUrl:(NSString *)picUrl placeholderImage:(UIImage *)holderImage duration:(CGFloat)duration animationOperaion:(SQImageAnimationOperation)operation completion:(void(^)(UIImage *image))completion {
    __weak typeof(self) _self = self;
    [self sd_setImageWithURL:(NSURL *)picUrl placeholderImage:holderImage options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        __strong typeof(_self) self = _self;
        if (image.images.count > 0) {
            return;
        }
        if (image) {
            if (cacheType == SDImageCacheTypeNone) {
                CATransition *transition = [CATransition animation];
                transition.duration = duration;
                transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
                transition.type = kCATransitionFade;
                [self addAnimation:transition forKey:@"fade_animation"];
            }else {
                self.contents = (id)image.CGImage;
            }
        }else {
            self.contents = (id)holderImage.CGImage;
        }
    }];
}


@end
