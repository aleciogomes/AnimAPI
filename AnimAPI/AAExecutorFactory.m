//
//  AAExecutorFactory.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 12/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AAExecutorFactory.h"

// general
#import "AAAnimationExecutor.h"
#import "AAAnimation.h"

// especifics
#import "AAForwardRotationExecutor.h"
#import "AABackwardRotationExecutor.h"
#import "AAFlipXRotationExecutor.h"
#import "AAFlipYRotationExecutor.h"
#import "AAScaleExecutor.h"

@implementation AAExecutorFactory

+(AAAnimationExecutor *)executorForAnimation:(AAAnimation *)animation {
    
    AAAnimationExecutor* animationExecutor = nil;
    switch (animation.animationType) {
        case rotation_forward:  animationExecutor = [[AAForwardRotationExecutor alloc] init]; break;
        case rotation_backward: animationExecutor = [[AABackwardRotationExecutor alloc] init]; break;
        case rotation_flip_x:   animationExecutor = [[AAFlipXRotationExecutor alloc] init]; break;
        case rotation_flip_y:   animationExecutor = [[AAFlipYRotationExecutor alloc] init]; break;
        case scale:             animationExecutor = [[AAScaleExecutor alloc] init]; break;
    }
    
    if (animationExecutor) {
        animationExecutor.animation = animation;
    }
    
    return animationExecutor;
}

@end
