//
//  AlertView.m
//  Ceshi
//
//  Created by yfmac001 on 2018/3/27.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "AlertView.h"
#import "UIColor+Random.h"
#import "HighilgthedBtn.h"

@interface AlertView ()
///临时按钮, 主要用于获取上一个按钮
@property(nonatomic, strong) HighilgthedBtn *tempBtn;
///按钮的Y值
@property (nonatomic, assign) CGFloat btnY;
@end

@implementation AlertView
///懒加载
- (HighilgthedBtn *)tempBtn {
    if(!_tempBtn){
        self.tempBtn = [HighilgthedBtn buttonWithType:UIButtonTypeCustom];
    }
    return _tempBtn;
}

- (void)alertTitles:(NSArray<NSString *> *)titles actionBgImages:(NSArray<NSString *> *)actionBgImages {
    
    for (int i = 0; i < titles.count; i++) {
        
        HighilgthedBtn *btn = [HighilgthedBtn buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:actionBgImages[i]] forState:UIControlStateNormal];
        btn.tag = i;
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchDown];
        //设置按钮的Y值
        self.btnY = CGRectGetMaxY(self.tempBtn.frame);
        
        if(i == 0) {//第一个action
            //修改字体
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            //颜色
            [btn setTitleColor:[UIColor rgbColorWithRed:155 green:155 blue:155 opacity:1.0] forState:UIControlStateNormal];
            //把按钮的用户交互关闭
            btn.userInteractionEnabled = NO;
        }else {
            //修改字体
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
            //颜色
            [btn setTitleColor:[UIColor rgbColorWithRed:50 green:46 blue:65 opacity:1.0] forState:UIControlStateNormal];
            //判断是不是最后一个按钮
            self.btnY += (i == titles.count -1) ? 7 : 0;
        }
        //设置frame
        btn.frame = CGRectMake(0, self.btnY, kScrentW, btn.currentBackgroundImage.size.height);
        //添加按钮到view上
        [self addSubview:btn];
        self.tempBtn = btn;
        
    }
}
#pragma mark - 动画开始
- (void)alertAppear {
    CGFloat h = self.frame.size.height;
    //动画效果
    [UIView animateWithDuration:0.4 animations:^{
        self.frame = CGRectMake(0, kScrentH - h, kScrentW, h);
    }];
}
#pragma mark - 动画结束
- (void)alertDisAppear {
    //动画效果
    [UIView animateWithDuration:0.4 animations:^{
        self.frame = CGRectMake(0, kScrentH, kScrentW, self.frame.size.height);
    }];
}
#pragma mark - 点击事件
- (void)clickAction:(HighilgthedBtn *)btn {
    if (self.clickBtn) {
        self.clickBtn(btn.tag);
    }
}
@end
