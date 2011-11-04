//
//  AABackwardRotation.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 06/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AABackwardRotationExecutor.h"

@implementation AABackwardRotationExecutor

-(void) prepareAnimation {
    [super prepareAnimation];
    
    if (animation.animationValue > 180) {
        caAnimation.values = [NSArray arrayWithObjects:
                              [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeRotation(((animation.animationValue - 180) * M_PI) / 180.0f, 0.0f, 0.0f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeRotation((animation.animationValue * M_PI) / 180.0f, 0.0f, 0.0f, 1.0f)],nil];
    }
    else {
        CGFloat angle = (animation.animationValue * M_PI) / 180.0f;
        if (angle < M_PI) {
            angle *= -1;
        }
        
        caAnimation.values = [NSArray arrayWithObjects:
                              [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.0f, 0.0f, 0.0f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeRotation(angle, 0.0f, 0.0f, 1.0f)],nil];
    }
}

@end
