//
//  DetailViewController.m
//  HUD
//
//  Created by lee on 2018/9/17.
//  Copyright © 2018年 lee. All rights reserved.
//

#import "DetailViewController.h"
#import "LoadingView.h"
#import "GIfLoadingView.h"

@interface DetailViewController ()

@property (nonatomic, strong) CALayer *myLayer;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;
@property (nonatomic, strong) CABasicAnimation *baseAnimation;

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    

    [self gifLoading];
    

}

- (void)gifLoading
{
    GIfLoadingView *lv = [[GIfLoadingView alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    [self.view addSubview:lv];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [lv removeFromSuperview];
    });
}

- (void)loading
{
    LoadingView *lv = [[LoadingView alloc] initWithFrame:CGRectMake(100, 200, 200, 60)];
    [self.view addSubview:lv];
    
    [lv startLoading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [lv dismissLoading];
        [lv removeFromSuperview];
    });
}

- (void)circle
{
    
    _replicatorLayer = [CAReplicatorLayer layer];
    _replicatorLayer.cornerRadius = 10.0;
    _replicatorLayer.frame = CGRectMake(0, 0, 20.0, 20.0);
    _replicatorLayer.position = CGPointMake(100.0, 200.0);
    _replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    _replicatorLayer.instanceCount = 100;
    _replicatorLayer.instanceTransform = CATransform3DMakeRotation(2*M_PI/100, 0, 0, 1);//每个layer之间的间距
    _replicatorLayer.instanceDelay = 1.0/100;
    [self.view.layer addSublayer:_replicatorLayer];
    
    CGFloat width = 3.0;
    _myLayer = [CALayer layer];
    _myLayer.masksToBounds = YES;
    _myLayer.frame = CGRectMake(0, 0, width, width);
    _myLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    _myLayer.cornerRadius = width/2;
    _myLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [_replicatorLayer addSublayer:_myLayer];
    
    _baseAnimation = [CABasicAnimation animation];
    _baseAnimation.repeatCount = MAXFLOAT;
    _baseAnimation.removedOnCompletion = NO;
    _baseAnimation.fillMode = kCAFillModeForwards;
    _baseAnimation.keyPath = @"transform.scale";
    _baseAnimation.duration = 1.0;
    _baseAnimation.fromValue = @1.0;
    _baseAnimation.toValue = @0.1;
    
    [_myLayer addAnimation:_baseAnimation forKey:@"hud"];
}

- (void)play
{
    _replicatorLayer = [CAReplicatorLayer layer];
    _replicatorLayer.cornerRadius = 10.0;
    _replicatorLayer.frame = CGRectMake(0, 0, 60.0, 100.0);
    _replicatorLayer.position = CGPointMake(100.0, 200.0);
    _replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    _replicatorLayer.instanceCount = 3;
    _replicatorLayer.instanceTransform = CATransform3DMakeTranslation(15, 0, 0);
    _replicatorLayer.instanceDelay = 0.2;
    _replicatorLayer.masksToBounds = YES;
    [self.view.layer addSublayer:_replicatorLayer];
    
    _myLayer = [CALayer layer];
    _myLayer.frame = CGRectMake(10, 100, 10, 30);
    _myLayer.backgroundColor = [UIColor darkGrayColor].CGColor;
    [_replicatorLayer addSublayer:_myLayer];
    
    _baseAnimation = [CABasicAnimation animation];
    _baseAnimation.repeatCount = MAXFLOAT;
    _baseAnimation.autoreverses = YES;
    _baseAnimation.fillMode = kCAFillModeForwards;
    _baseAnimation.keyPath = @"position.y";
    _baseAnimation.duration = 0.45;
    _baseAnimation.fromValue = @80;
    _baseAnimation.toValue = @100;
    
    [_myLayer addAnimation:_baseAnimation forKey:@"hudd"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
