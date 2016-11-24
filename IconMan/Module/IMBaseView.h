//
//  IMBaseView.h
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/21.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface IMBaseView : NSView

@property (nonatomic, assign) IBInspectable BOOL borderTop;
@property (nonatomic, assign) IBInspectable BOOL borderLeft;
@property (nonatomic, assign) IBInspectable BOOL borderBottom;
@property (nonatomic, assign) IBInspectable BOOL borderRight;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable NSColor *borderColor;
@property (nonatomic, strong) IBInspectable NSColor *backgroundColor;

@end
