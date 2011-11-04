//
//  AAFileReader.h
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AAAnimation.h"

@interface AAFileReader : NSObject {
}

- (AAAnimation*) loadAnimationFromFile:(NSString*) path;
- (AAAnimation*) loadAnimationAtIndex:(int) index FromFile:(NSString*) path;

// private
//- (NSData*) readImageDataFromFile:(FILE*) pFile;
//- (void)    stepImageFromFile:(FILE*) pFile;

@end
