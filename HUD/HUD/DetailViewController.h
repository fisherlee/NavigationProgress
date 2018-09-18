//
//  DetailViewController.h
//  HUD
//
//  Created by lee on 2018/9/17.
//  Copyright © 2018年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

