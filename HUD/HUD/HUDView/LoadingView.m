//
//  LoadingView.m
//  HUD
//
//  Created by lee on 2018/9/18.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

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
    [self addSubview:self.indicatorView];
    [self addSubview:self.textLabel];
}

- (void)startLoading
{
    self.textLabel.text = @"正在载入";
    [self.indicatorView startAnimating];
}

- (void)dismissLoading
{
    [self.indicatorView stopAnimating];
}

- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        CGRect slice, remainder;
        CGRectDivide(self.bounds, &slice, &remainder, CGRectGetHeight(self.bounds)*2/3, CGRectMinYEdge);
        _indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:slice];
        _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        _indicatorView.backgroundColor = [UIColor clearColor];
    }
    return _indicatorView;
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
