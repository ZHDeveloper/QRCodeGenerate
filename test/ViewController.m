//
//  ViewController.m
//  test
//
//  Created by AdminZhiHua on 15/12/11.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>
#import "UIImage+QRCodeImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *codeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置imageView 的样式
    self.codeView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.codeView.layer.shadowRadius = 1;
    self.codeView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.codeView.layer.shadowOpacity = 0.3;
    
//    self.codeView.image = [UIImage QRCodeImageWith:@"iPhone 6s" imageScale:5];
//    self.codeView.image = [UIImage QRCodeImageWith:@"iPhone 6s" imageScale:5 withRed:0.3 andGreen:0.2 andBlue:0.5];
//    self.codeView.image = [UIImage QRCodeImageWith:@"iPhone 6s" insertAvartImage:[UIImage imageNamed:@"avart"] imageScale:5];
    self.codeView.image = [UIImage QRCodeImageWith:@"iPhone 6s" insertAvartImage:[UIImage imageNamed:@"avart"] imageScale:0 withRed:0.2 andGreen:0.4 andBlue:0.3];
    
}





@end
