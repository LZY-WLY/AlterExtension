//
//  UIColor+Random.h
//  Ceshi
//
//  Created by yfmac001 on 2018/3/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Random)
///rgb颜色
+ (id)rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue opacity:(CGFloat)opacity;
///随机颜色
+ (id)randomColor;
@end
