//
//  IMBaseView.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/21.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "IMBaseView.h"

@interface IMBaseView ()

@property (nonatomic, strong) CALayer *borderTopLayer;
@property (nonatomic, strong) CALayer *borderLeftLayer;
@property (nonatomic, strong) CALayer *borderBottomLayer;
@property (nonatomic, strong) CALayer *borderRightlayer;

@end

@implementation IMBaseView

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.wantsLayer = YES;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [self.backgroundColor setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

#pragma mark - Setup method

- (void)setupBorder {
    if (self.borderTop) {
        self.borderTopLayer.frame = NSMakeRect(0.0, 0.0, CGRectGetWidth(self.frame), self.borderWidth);
        self.borderTopLayer.backgroundColor = self.borderColor.CGColor;
        [self.layer addSublayer:self.borderTopLayer];
    } else {
        [self.borderTopLayer removeFromSuperlayer];
    }
    if (self.borderLeft) {
        self.borderLeftLayer.frame = NSMakeRect(0.0, 0.0, self.borderWidth, CGRectGetHeight(self.frame));
        self.borderLeftLayer.backgroundColor = self.borderColor.CGColor;
        [self.layer addSublayer:self.borderLeftLayer];
    } else {
        [self.borderLeftLayer removeFromSuperlayer];
    }
    if (self.borderBottom) {
        self.borderBottomLayer.frame = NSMakeRect(0.0, CGRectGetHeight(self.frame) - self.borderWidth, CGRectGetWidth(self.frame), self.borderWidth);
        self.borderBottomLayer.backgroundColor = self.borderColor.CGColor;
        [self.layer addSublayer:self.borderBottomLayer];
    } else {
        [self.borderBottomLayer removeFromSuperlayer];
    }
    if (self.borderRight) {
        self.borderRightlayer.frame = NSMakeRect(CGRectGetWidth(self.frame), 0.0, self.borderWidth, CGRectGetHeight(self.frame));
        self.borderRightlayer.backgroundColor = self.borderColor.CGColor;
        [self.layer addSublayer:self.borderRightlayer];
    } else {
        [self.borderRightlayer removeFromSuperlayer];
    }
}

#pragma mark - Property method

- (BOOL)isFlipped {
    return YES;
}

- (void)setBorderTop:(BOOL)borderTop {
    _borderTop = borderTop;
    [self setupBorder];
}

- (void)setBorderLeft:(BOOL)borderLeft {
    _borderLeft = borderLeft;
    [self setupBorder];
}

- (void)setBorderBottom:(BOOL)borderBottom {
    _borderBottom = borderBottom;
    [self setupBorder];
}

- (void)setBorderRight:(BOOL)borderRight {
    _borderRight = borderRight;
    [self setupBorder];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setupBorder];
}

- (void)setBorderColor:(NSColor *)borderColor {
    _borderColor = borderColor;
    [self setupBorder];
}

- (void)setBackgroundColor:(NSColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    self.needsDisplay = YES;
}

- (CALayer *)borderTopLayer {
    if (_borderTopLayer == nil) {
        _borderTopLayer = [CALayer layer];
    }
    return _borderTopLayer;
}

- (CALayer *)borderLeftLayer {
    if (_borderLeftLayer == nil) {
        _borderLeftLayer = [CALayer layer];
    }
    return _borderLeftLayer;
}

- (CALayer *)borderBottomLayer {
    if (_borderBottomLayer == nil) {
        _borderBottomLayer = [CALayer layer];
    }
    return _borderBottomLayer;
}

- (CALayer *)borderRightlayer {
    if (_borderRightlayer == nil) {
        _borderRightlayer = [CALayer layer];
    }
    return _borderRightlayer;
}

@end
