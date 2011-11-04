//
//  AAScaleExecutor.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 07/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AAScaleExecutor.h"
#import <QuartzCore/CoreAnimation.h>


@implementation AAScaleExecutor

-(void) execute{
    [self layer];
    [self executeInLayer:workLayer];
}

-(void) executeInLayer:(CALayer *)aLayer {
    
    if (!caAnimation) {
        [self prepareAnimation];
    }
    
    [aLayer addAnimation:caAnimation forKey:@"transform"];
}

-(void) prepareAnimation {
    [super prepareAnimation];
    
    CGFloat factor = 1.0f * animation.animationValue;
    
    caAnimation.values = [NSArray arrayWithObjects:
                    [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)], 
                    [NSValue valueWithCATransform3D:CATransform3DMakeScale(factor, factor, 1.0f)], nil];
}

@end
