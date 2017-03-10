//
//  AnimalLabel.m
//  AnimalTest1
//
//  Created by VincentWe on 2016/12/27.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import "AnimalLabel.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width         //屏幕宽
#define ScreenHeight [UIScreen mainScreen].bounds.size.height       //屏幕高
#define ScreenScale [UIScreen mainScreen].bounds.size.width/375/2 //页面布局尺寸比例
#define ScreenRGB(x,y,z) [UIColor colorWithRed:x/255.0f green:y/255.f blue:z/255.0f alpha:1.0f] //RGB颜色值
@implementation AnimalLabel

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //X标记
        _xLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (42-36)*ScreenScale/2, 27*ScreenScale, 42*ScreenScale)];
        _xLabel.text = @"x";
        _xLabel.textColor = ScreenRGB(255.0f, 58.0f, 155.0f);
        _xLabel.font = [UIFont systemFontOfSize:36*ScreenScale];
        [self addSubview:_xLabel];
        //数量
        _numLabel = [[UILabel alloc]initWithFrame:CGRectMake(_xLabel.frame.origin.x+_xLabel.frame.size.width, 0, (42*3+10)*ScreenScale, 42*ScreenScale)];
        _numLabel.textColor = ScreenRGB(255.0f, 58.0f, 155.0f);
        _numLabel.font = [UIFont systemFontOfSize:42*ScreenScale];
        [self addSubview:_numLabel];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
