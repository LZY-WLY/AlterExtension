//
//  ViewController.m
//  Ceshi
//
//  Created by yfmac001 on 2018/3/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"
@interface ViewController ()
@property(nonatomic, strong) AlertView *alertView;
@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.alertView alertAppear];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.alertView = [[AlertView alloc]initWithFrame:CGRectMake(0, kScrentH, kScrentW, 196)];
    NSArray *titles = @[@"性别只能选择一次, 注册后不能修改", @"男性", @"女性", @"取消"];
    NSArray *actionBgImage = @[@"弹窗(提示)", @"弹窗(性别)", @"弹窗(性别)", @"弹窗(取消)"];;
    [self.alertView alertTitles:titles actionBgImages:actionBgImage];
    [self.view addSubview:self.alertView];
    
    //block回调事件
    __weak ViewController *weakSelf = self;
    [self.alertView setClickBtn:^(NSInteger tag) {
        switch (tag) {
            case 1:
                 NSLog(@"男性");
                break;
            case 2:
                NSLog(@"女性");
                break;
            case 3:
                NSLog(@"取消");
                break;
                
            default:
                break;
        }
        [weakSelf.alertView alertDisAppear];
    }];
}

@end
