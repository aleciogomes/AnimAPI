//
//  AAAnimation.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 04/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AAAnimation.h"


@implementation AAAnimation

@synthesize flags;
@synthesize animationType;
@synthesize animationEffect;
@synthesize animationValue;
@synthesize animationTime;
@synthesize animationImage;

-(id) init{
	return [self initWithType:rotation_forward andValue:0.0F andTime:0.0F];
}

-(id) initWithType:(AAAnimationType) type andValue:(float)value andTime:(float)time{
	if ([super init]) {
		self.animationType = type;
		self.animationValue = value;
		self.animationTime = time;
        self.animationEffect = linear;
		self.animationImage = nil;
		
		return self;
	}
		 
	return nil;
}

-(void) dealloc{
	[animationImage release];
	
	[super dealloc];
}

-(void)setAnimationImageWithData:(NSData *) data {
    [animationImage release];
    
    self.animationImage = [UIImage imageWithData:data];
}

@end
