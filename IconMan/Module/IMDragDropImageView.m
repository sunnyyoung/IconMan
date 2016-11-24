//
//  IMDragDropImageView.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/17.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "IMDragDropImageView.h"

@interface IMDragDropImageView () <NSDraggingDestination>

@end

@implementation IMDragDropImageView

#pragma mark - Lifecycle

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self registerForDraggedTypes:[NSImage imageTypes]];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

#pragma mark - Dragging Destination Delegate

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    if ([NSImage canInitWithPasteboard:sender.draggingPasteboard] && sender.draggingSourceOperationMask & NSDragOperationCopy) {
        self.image = [NSImage imageNamed:@"Drag.Entered"];
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender {
    self.image = [NSImage imageNamed:@"Drag.Exited"];
}

@end
