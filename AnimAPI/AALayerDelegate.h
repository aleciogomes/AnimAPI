//
//  AALayerDelegateProtocol.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 05/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AAAnimationExecutor;
@protocol AALayerDelegate <NSObject>

@optional
-(CALayer*) layerForAnimation:(AAAnimationExecutor*) animationExecutor;

@end
