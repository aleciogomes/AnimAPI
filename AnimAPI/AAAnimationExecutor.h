//
//  AAAnimationExecutor.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 04/03/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "AAAnimation.h"
#import "AAExecutorProtocol.h"

@protocol AALayerDelegate;
@interface AAAnimationExecutor : NSObject <AAExecutorProtocol> {
	AAAnimation*            animation;
    CAKeyframeAnimation*    caAnimation;
    CALayer*                workLayer;
    id<AALayerDelegate>     layerDelegate;
}

@property (retain) AAAnimation* animation;
@property (retain) CAKeyframeAnimation* caAnimation;
@property (assign) id<AALayerDelegate> layerDelegate;
@property (getter=layer, retain) CALayer* workLayer;

-(id) init;

-(void) execute;
-(void) executeInLayer:(CALayer *)aLayer;

-(void) prepareAnimation;

@end