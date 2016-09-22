//
//  BaseModel.h
//  Movie
//
//  Created by wei.chen on 13-9-3.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (id)initContentWithDic:(NSDictionary *)jsonDic;
- (void)setAttributes:(NSDictionary *)jsonDic;
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;

@end
