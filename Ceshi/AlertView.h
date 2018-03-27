//
//  AlertView.h
//  Ceshi
//
//  Created by yfmac001 on 2018/3/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScrentW [UIScreen mainScreen].bounds.size.width
#define kScrentH [UIScreen mainScreen].bounds.size.height
@interface AlertView : UIView
///点击按钮的序号
@property(nonatomic, copy) void(^clickBtn)(NSInteger tag);
///输入标题数组和背景数组
- (void)alertTitles:(NSArray<NSString *> *)titles actionBgImages:(NSArray<NSString *> *)actionBgImages;
///动画开始(AlertView弹出)
- (void)alertAppear;
///动画结束(AlertView退出)
- (void)alertDisAppear;
@end
