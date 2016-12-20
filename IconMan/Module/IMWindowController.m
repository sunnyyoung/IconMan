//
//  IMWindowController.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/17.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "IMWindowController.h"

@interface IMWindowController ()

@end

@implementation IMWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self setupTitle];
    [self setupButton];
    [self setupTouchBar];
}

- (void)setupTitle {
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent = YES;
}

- (void)setupButton {
    NSButton *closeButton = [self.window standardWindowButton:NSWindowCloseButton];
    NSButton *zoomButton = [self.window standardWindowButton:NSWindowZoomButton];
    NSButton *minimizeButton = [self.window standardWindowButton:NSWindowMiniaturizeButton];
    CGRect closeButtonFrame = closeButton.frame;
    closeButtonFrame.origin.y = -2;
    closeButton.frame = closeButtonFrame;
    CGRect zoomButtonFrame = zoomButton.frame;
    zoomButtonFrame.origin.y = -2;
    zoomButton.frame = zoomButtonFrame;
    CGRect minimizeButtonFrame = minimizeButton.frame;
    minimizeButtonFrame.origin.y = -2;
    minimizeButton.frame = minimizeButtonFrame;
}

- (void)setupTouchBar {
    [self bind:@"touchBar" toObject:self.contentViewController withKeyPath:@"touchBar" options:nil];
}

@end
