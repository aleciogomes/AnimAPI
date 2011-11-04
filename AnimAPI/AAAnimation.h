//
//  AAAnimation.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 04/03/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

#import "AADefs.h"

@interface AAAnimation : NSObject {
    unsigned long       flags;
	AAAnimationType     animationType;
    AAAnimationEffect   animationEffect;
	CGFloat             animationValue;
	CGFloat             animationTime;
	UIImage*            animationImage;
}

@property (assign) unsigned long        flags;
@property (assign) AAAnimationType      animationType;
@property (assign) AAAnimationEffect    animationEffect;
@property (assign) CGFloat              animationValue;
@property (assign) CGFloat              animationTime;

@property (copy)   UIImage*             animationImage;

-(id) init;
-(id) initWithType:(AAAnimationType) type andValue:(float) value andTime:(float) time;

-(void)dealloc;

-(void)setAnimationImageWithData:(NSData *) data;

@end
