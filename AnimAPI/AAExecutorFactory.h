//
//  AAExecutorFactory.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 12/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAAnimationExecutor;
@class AAAnimation;

@interface AAExecutorFactory : NSObject {    
}

+(AAAnimationExecutor*) executorForAnimation:(AAAnimation*) animation;

@end
