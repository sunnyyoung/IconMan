//
//  NSImage+IMCategory.h
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/19.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (IMCategory)

- (NSImage *)im_resizeImageWithSize:(CGSize)size scale:(CGFloat)scale;
- (NSData *)im_toData;

@end
