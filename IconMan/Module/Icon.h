//
//  Icon.h
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/18.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Icon : NSObject

@property (copy) NSString *idiom;
@property (copy) NSString *size;
@property (copy) NSString *scale;

- (instancetype)initWithIdiom:(NSString *)idiom size:(NSString *)size scale:(NSString *)scale;
- (CGSize)iconSize;
- (CGFloat)iconScale;
- (NSString *)fileName;

+ (NSArray<Icon *> *)iconArrayWithFileName:(NSString *)fileName;

@end
