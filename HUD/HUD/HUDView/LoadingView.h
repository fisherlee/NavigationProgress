//
//  LoadingView.h
//  HUD
//
//  Created by lee on 2018/9/18.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UILabel *textLabel;

- (void)startLoading;
- (void)dismissLoading;

@end
