//
//  GIfLoadingView.m
//  HUD
//
//  Created by lee on 2018/9/18.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "GIfLoadingView.h"
#import "UIImage+GIF.h"

@implementation GIfLoadingView

- (id)init
{
    self = [super init];
    if (self) {
        [self makeContaintsSubView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeContaintsSubView];
    }
    return self;
}


- (void)makeContaintsSubView
{
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"loading3" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
    self.imageView.image = [UIImage gifWithData:gifData scale:1.0];
    [self addSubview:self.imageView];
    
    self.textLabel.text = @"正在载入";
    [self addSubview:self.textLabel];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        CGRect slice, remainder;
        CGRectDivide(self.bounds, &slice, &remainder, CGRectGetHeight(self.bounds)*2/3, CGRectMinYEdge);
        _imageView = [[UIImageView alloc] initWithFrame:slice];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeCenter;
    }
    return _imageView;
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        CGRect slice, remainder;
        CGRectDivide(self.bounds, &slice, &remainder, CGRectGetHeight(self.bounds)/3, CGRectMaxYEdge);
        _textLabel = [[UILabel alloc] initWithFrame:slice];
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.adjustsFontSizeToFitWidth = YES;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.textColor = [UIColor lightGrayColor];
    }
    return _textLabel;
}


@end
