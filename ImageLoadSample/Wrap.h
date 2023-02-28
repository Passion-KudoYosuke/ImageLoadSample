#import <Foundation/Foundation.h>

@interface Wrapper : NSObject

-(void)ImagePathSet:(NkflSessionParam*)sessionParam path:(NSString*)filePath;

-(void)ImageRead:(NkflImageParam*)imageParam imageInfo:(NkflImageInfoParam*)imageInfoParam resultPoint:(char*)resultData;

@end
