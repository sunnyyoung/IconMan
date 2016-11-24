//
//  NSImage+IMCategory.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/19.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "NSImage+IMCategory.h"

@implementation NSImage (IMCategory)

- (NSImage *)im_resizeImageWithSize:(CGSize)size scale:(CGFloat)scale {
    CGSize newSize = CGSizeMake(size.width * scale, size.height * scale);
    if (!CGSizeEqualToSize(self.size, size)) {
        NSImage *resizedImage = self.copy;
        resizedImage.size = newSize;
        return resizedImage;
    } else {
        return self;
    }
}

- (NSData *)im_toData {
    if (self == nil) {
        return nil;
    }
    NSBitmapImageRep *representation = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:nil
                                                                               pixelsWide:self.size.width
                                                                               pixelsHigh:self.size.height
                                                                            bitsPerSample:8
                                                                          samplesPerPixel:4
                                                                                 hasAlpha:YES
                                                                                 isPlanar:NO
                                                                           colorSpaceName:NSCalibratedRGBColorSpace
                                                                              bytesPerRow:0
                                                                             bitsPerPixel:0];
    representation.size = self.size;
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:representation]];
    [self drawInRect:NSMakeRect(0.0, 0.0, self.size.width, self.size.height) fromRect:NSZeroRect operation:NSCompositingOperationCopy fraction:1.0];
    [NSGraphicsContext restoreGraphicsState];
    NSData *imageData = [representation representationUsingType:NSBitmapImageFileTypePNG properties:@{}];
    return imageData;
}

@end
