//
//  IMMainViewController.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/17.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "IMMainViewController.h"
#import "IMDragDropImageView.h"
#import "NSImage+IMCategory.h"
#import "Icon.h"

@interface IMMainViewController ()

@property (weak) IBOutlet IMDragDropImageView *imageView;
@property (strong) NSArray<Icon *> *iOSIconArray;
@property (strong) NSArray<Icon *> *macOSIconArray;
@property (strong) NSArray<Icon *> *watchOSArray;
@property (weak) IBOutlet NSSegmentedControl *platformSegmentControl;

@end

@implementation IMMainViewController

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.iOSIconArray = [Icon iconArrayWithFileName:@"iOS"];
        self.macOSIconArray = [Icon iconArrayWithFileName:@"macOS"];
        self.watchOSArray = [Icon iconArrayWithFileName:@"watchOS"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Event Response

- (IBAction)generateAction:(NSButton *)sender {
    if (self.imageView.image == [NSImage imageNamed:@"Drag.Exited"]) {
        return;
    }
    NSOpenPanel *openPanel = [self openPanel];
    NSWindow *window = [NSApplication sharedApplication].windows.firstObject;
    [openPanel beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            NSURL *url = openPanel.URLs.firstObject;
            for (Icon *icon in self.selectedIconArray) {
                NSImage *image = [self.imageView.image im_resizeImageWithSize:icon.iconSize scale:icon.iconScale];
                [image.im_toData writeToURL:[url URLByAppendingPathComponent:icon.fileName] atomically:YES];
            }
        }
    }];
}

#pragma mark - Property method

- (NSOpenPanel *)openPanel {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = NO;
    openPanel.canChooseDirectories = YES;
    openPanel.canCreateDirectories = YES;
    return openPanel;
}

- (NSArray<Icon *> *)selectedIconArray {
    NSUInteger selectedIndex = self.platformSegmentControl.selectedSegment;
    if (selectedIndex == 0) {
        return self.iOSIconArray;
    } else if (selectedIndex == 1) {
        return self.macOSIconArray;
    } else if (selectedIndex == 2) {
        return self.watchOSArray;
    } else {
        return nil;
    }
}

@end
