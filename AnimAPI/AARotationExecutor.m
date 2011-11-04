//
//  AARotationExecutor.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 07/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AARotationExecutor.h"

@implementation AARotationExecutor

-(void) execute{
    [self layer];    
    [self executeInLayer:workLayer];
}

-(void)executeInLayer:(CALayer *)aLayer {
    
    if (!caAnimation) {
        [self prepareAnimation];
    }

	[aLayer addAnimation:caAnimation forKey:@"transform"];
}

-(void) prepareAnimation {
    [super prepareAnimation];
}

@end
