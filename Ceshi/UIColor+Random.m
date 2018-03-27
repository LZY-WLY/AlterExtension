//
//  UIColor+Random.m
//  Ceshi
//
//  Created by yfmac001 on 2018/3/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "UIColor+Random.h"

@implementation UIColor (Random)
+ (id)rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue opacity:(CGFloat)opacity {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:opacity];
    
}
+ (id)randomColor {
    
   return [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
}
@end
