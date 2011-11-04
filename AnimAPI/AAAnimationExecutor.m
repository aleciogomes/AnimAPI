//
//  AAAnimationExecutor.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 04/03/11.
//  Copyright 2011. All rights reserved.
//

#import "AAAnimationExecutor.h"
#import "AALayerDelegate.h"

@implementation AAAnimationExecutor

@synthesize animation;
@synthesize caAnimation;
@synthesize workLayer;
@synthesize layerDelegate;

-(id) init{
    self = [super init];
    
    if (self) {
        self.animation = nil;
        self.workLayer = nil;
        self.layerDelegate = nil;
        self.caAnimation = nil;    
    }
    
    return self;
}

-(CALayer*) layer{
    if (!workLayer) {
        if( [layerDelegate conformsToProtocol:@protocol(AALayerDelegate)] ) {
            workLayer = [layerDelegate layerForAnimation:self];
        }
        else {
            // construir um layer com informações padrão
            NSAssert(NO, @"Not implemented yet");
        }
    }
    
    return workLayer;
}

-(void) execute {
    NSAssert(NO, @"Eu não deveria estar executando isso aqui...");
}

-(void) executeInLayer:(CALayer *)aLayer {
    NSAssert(NO, @"Eu não deveria estar executando isso aqui...");
}

-(void) prepareAnimation {
    if (caAnimation) {
        [caAnimation release];
        caAnimation = nil;
    }
    
    caAnimation = [[CAKeyframeAnimation alloc] init];
    
    caAnimation.duration = animation.animationTime;
    caAnimation.autoreverses = (animation.flags & AA_AUTO_REVERSE) == AA_AUTO_REVERSE;
    
    switch (animation.animationEffect) {
        case linear:
            caAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]; break;
        case easeIn:
            caAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]; break;
        case easeOut:
            caAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]; break;
        case easeInOut:
            caAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; break;
    }
}

@end
