//
//  AAFileReader.m
//  AnimAPI
//
//  Created by Alécio José Gomes Neto on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AAFileReader.h"
#import "AADefs.h"

@implementation AAFileReader

- (NSData*) readImageDataFromFile:(FILE*) pFile {
    int cb = 0;
    fread(&cb, sizeof(int), 1, pFile);
    
    Byte* pBytes = malloc(cb);
    memset(pBytes, 0, cb);    
    fread(pBytes, cb, 1, pFile);
    
    NSData *data = [[NSData alloc] initWithBytes:pBytes length:cb];;
    free(pBytes);
    return data;
}

- (void) stepImageFromFile:(FILE*) pFile {
    int cb = 0;
    fread(&cb, sizeof(int), 1, pFile);
    fseek(pFile, cb, SEEK_CUR);
}

- (AAAnimation*) loadAnimationFromFile:(NSString*) path {
    
    FILE* pFile = fopen([path UTF8String], "rb");
    
    if (pFile == NULL) {
        return nil;
    }
    
    struct AA_ANIMATION_HEADER anmHdr;
    memset(&anmHdr, 0, sizeof(anmHdr));
    
    // le o header de controle
    if( fread(&anmHdr, sizeof(anmHdr), 1, pFile) != 1){
        fclose(pFile);
        return nil;
    }
    
    struct AA_ANIMATION_BLOCK anmBlock;
    memset(&anmBlock, 0, sizeof(anmBlock));
    // agora já sabe-se a quantidade de animações
    // anmHdr.animationQty
    // mas eu sei que é 1 hehe
    if (fread(&anmBlock, sizeof(anmBlock), 1, pFile) != 1) {
        fclose(pFile);
        return nil;
    }
    
    AAAnimation *animation = [[AAAnimation alloc] init];
    animation.animationType  = (AAAnimationType)anmBlock.animationType;
    animation.animationValue = anmBlock.animationValue;
    animation.animationTime  = anmBlock.animationTime;
    animation.animationEffect= (AAAnimationEffect)anmBlock.animationEffect;
    animation.flags          = anmBlock.flags;
    
    NSData *data = [self readImageDataFromFile: pFile];
    [animation setAnimationImageWithData:data];
    [data release];
    
    return animation;
}

- (AAAnimation*) loadAnimationAtIndex:(int) index FromFile:(NSString*) path {
    FILE* pFile = fopen([path UTF8String], "rb");
    
    if (pFile == NULL) {
        return nil;
    }
    
    struct AA_ANIMATION_HEADER anmHdr;
    memset(&anmHdr, 0, sizeof(anmHdr));
    
    // le o header de controle
    if( fread(&anmHdr, sizeof(anmHdr), 1, pFile) != 1){
        fclose(pFile);
        return nil;
    }
    
    if (index >= anmHdr.imagesQty) {
        // indice inválido, amigo
        return nil;
    }
    
    struct AA_ANIMATION_BLOCK anmBlock;
    memset(&anmBlock, 0, sizeof(anmBlock));
    
    if (index > 0) {
        fseek(pFile, index * sizeof(anmBlock), SEEK_CUR);
    }
    
    if (fread(&anmBlock, sizeof(anmBlock), 1, pFile) != 1) {
        fclose(pFile);
        return nil;
    }
    
    for (int i = 0; i < anmBlock.idImage - 1; i++) {
        [self stepImageFromFile:pFile];
    }
    
    AAAnimation *animation = [[AAAnimation alloc] init];
    animation.animationType = (AAAnimationType)anmBlock.animationType;
    animation.animationValue = anmBlock.animationValue;
    animation.animationTime = anmBlock.animationTime;
    
    NSData *data = [self readImageDataFromFile: pFile];
    [animation setAnimationImageWithData:data];
    [data release];
    
    return animation;
}

@end
