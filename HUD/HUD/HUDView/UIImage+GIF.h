//
//  UIImageView+GIF.h
//  HUD
//
//  Created by lee on 2018/9/18.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GIF)

+ (UIImage *)gifWithData:(NSData *)data scale:(CGFloat)scale;

@end
