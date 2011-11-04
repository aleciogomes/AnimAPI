//
//  AAScaleExecutor.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 07/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AAAnimationExecutor.h"

@interface AAScaleExecutor : AAAnimationExecutor {
}

-(void) execute;
-(void) executeInLayer:(CALayer *)aLayer;
-(void) prepareAnimation;

@end
