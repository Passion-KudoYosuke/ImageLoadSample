//
//  test.m
//  ImageLoadSample
//
//  Created by kudo on 2023/02/02.
//

#import <Foundation/Foundation.h>
#import "Nkfl_Interface.h"
#import "Wrap.h"

@implementation Wrapper

-(id)init{
    self = [super init];
    
    return self;
}

-(void)ImagePathSet:(NkflSessionParam*)sessionParam path:(NSString*)filePath {
    
    const char *target = [filePath UTF8String];
    
    sessionParam->pFileInfo = (void*)target;
    
}

-(void)ImageRead:(NkflImageParam*)imageParam imageInfo:(NkflImageInfoParam*)imageInfoParam resultPoint:(char*)resultData{
    
    unsigned long ulLength = imageInfoParam->ulWidth * imageInfoParam->ulHeight * imageInfoParam->ulByteDepth * 3;
    char* pImageData = NULL;
    pImageData = malloc(sizeof(char) * ulLength);
    
    imageParam->ulSize = sizeof(NkflImageParam);
    imageParam->ulSessionID = imageInfoParam->ulSessionID;
    imageParam->rectArea.left = 0;
    imageParam->rectArea.top = 0;
    imageParam->rectArea.right = imageInfoParam->ulWidth;
    imageParam->rectArea.bottom = imageInfoParam->ulHeight;
    imageParam->ulDataSize = ulLength;
    //imageParam->pData = pImageData;
    imageParam->pData = resultData;
    imageParam->pFunc = NULL;
    imageParam->pProgressParam = NULL;
    
    unsigned long err = 0;
    err = Nkfl_Entry(kNkfl_Cmd_GetImageData, imageParam);
    
    //resultData = pImageData;
}

@end


