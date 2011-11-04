/*
 *  AnimAPIDefs.h
 *  AnimAPI
 *
 *  Created by Alécio José Gomes Neto on 04/03/11.
 *  Copyright 2011. All rights reserved.
 *
 */

// Struct file types

struct AA_ANIMATION_HEADER {
	char fileVer;
    int blocksQty;
	int imagesQty;
};

enum {
    AA_AUTO_REVERSE = 1,
};

struct AA_ANIMATION_BLOCK {
    unsigned long flags;  
	short animationType;
    short animationEffect;
	float animationTime;
	float animationValue;
	int idImage;
};

// Runtime types

typedef enum {
	rotation_forward = 0,
    rotation_backward,
    rotation_flip_x,
    rotation_flip_y,
	scale,
} AAAnimationType;

typedef enum {
    linear = 0,
    easeIn,
    easeOut,
    easeInOut,
} AAAnimationEffect;