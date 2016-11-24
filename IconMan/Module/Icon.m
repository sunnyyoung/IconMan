//
//  Icon.m
//  IconMan
//
//  Created by Sunnyyoung on 2016/11/18.
//  Copyright © 2016年 Sunnyyoung. All rights reserved.
//

#import "Icon.h"

@implementation Icon

#pragma mark - Lifecycle

- (instancetype)initWithIdiom:(NSString *)idiom size:(NSString *)size scale:(NSString *)scale {
    self = [super init];
    if (self) {
        self.idiom = idiom;
        self.size = size;
        self.scale = scale;
    }
    return self;
}

- (CGSize)iconSize {
    if (!self.size.length) {
        return CGSizeZero;
    }
    NSArray *sizeArray = [self.size componentsSeparatedByString:@"x"];
    if (sizeArray.count == 1) {
        return CGSizeMake([sizeArray.firstObject floatValue], [sizeArray.firstObject floatValue]);
    } else if (sizeArray.count == 2) {
        return CGSizeMake([sizeArray.firstObject floatValue], [sizeArray.lastObject floatValue]);
    } else {
        return CGSizeZero;
    }
}

- (CGFloat)iconScale {
    if (!self.scale.length) {
        return 1.0;
    }
    return [self.scale stringByReplacingOccurrencesOfString:@"x" withString:@""].floatValue;
}

- (NSString *)fileName {
    return [NSString stringWithFormat:@"%@-%@@%@.png", self.idiom, self.size, self.scale];
}

+ (NSBundle *)resourcesBundle {
    return [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Resources" withExtension:@"bundle"]];
}

+ (NSArray<Icon *> *)iconArrayWithFileName:(NSString *)fileName {
    NSError *error = nil;
    NSString *jsonFilePath = [[Icon resourcesBundle] pathForResource:fileName ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
    if (error) {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    NSArray *dictioanryArray = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSMutableArray *iconArray = [NSMutableArray array];
    for (NSDictionary *dictionary in dictioanryArray) {
        Icon *icon = [[Icon alloc] initWithIdiom:dictionary[@"idiom"] size:dictionary[@"size"] scale:dictionary[@"scale"]];
        [iconArray addObject:icon];
    }
    return iconArray;
}

@end
