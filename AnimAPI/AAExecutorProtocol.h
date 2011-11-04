//
//  AAExecutorProtocol.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AAExecutorProtocol <NSObject>

-(void) execute;
-(void) executeInLayer:(CALayer*) aLayer;
-(void) prepareAnimation;

@end