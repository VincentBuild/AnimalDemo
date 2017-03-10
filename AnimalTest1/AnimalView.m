//
//  AnimalView.m
//  AnimalTest
//
//  Created by VincentWe on 2016/12/12.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import "AnimalView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width         //屏幕宽
#define ScreenHeight [UIScreen mainScreen].bounds.size.height       //屏幕高
#define ScreenScale [UIScreen mainScreen].bounds.size.width/375/2 //页面布局尺寸比例
#define ScreenRGB(x,y,z) [UIColor colorWithRed:x/255.0f green:y/255.f blue:z/255.0f alpha:1.0f] //RGB颜色值

@implementation AnimalView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //背景
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(30*ScreenScale, 10*ScreenScale, 280*ScreenScale, 68*ScreenScale)];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.3;
        _bgView.layer.cornerRadius = 68*ScreenScale/2;
        _bgView.layer.masksToBounds = YES;
        [self addSubview:_bgView];
        
        
        
        //用户名称
        _userName = [[UILabel alloc]initWithFrame:CGRectMake(60*ScreenScale, 10*ScreenScale, (280-138)*ScreenScale, _bgView.frame.size.height/2)];
        _userName.text = @"天使的翅膀";
        _userName.textColor = [UIColor whiteColor];
        _userName.font = [UIFont systemFontOfSize:26*ScreenScale];
        [self addSubview:_userName];
        //礼物类型
        _giftType = [[UILabel alloc]initWithFrame:CGRectMake(_userName.frame.origin.x, _userName.frame.origin.y+_userName.frame.size.height, _userName.frame.size.width, _userName.frame.size.height)];
        _giftType.text = @"鲜花朵朵";
        _giftType.textColor = ScreenRGB(252.0f, 217.0f, 1.0f);
        _giftType.font = [UIFont systemFontOfSize:26*ScreenScale];
        [self addSubview:_giftType];
        //礼物
        _img = [[UIImageView alloc]initWithFrame:CGRectMake(_userName.frame.origin.x+_userName.frame.size.width, 0, 88*ScreenScale, 88*ScreenScale)];
        _img.image = [UIImage imageNamed:@"live_gift_s"];
        [self addSubview:_img];
        //礼物数量
        _giftNum = [[AnimalLabel alloc]initWithFrame:CGRectMake(_bgView.frame.origin.x+_bgView.frame.size.width+20*ScreenScale, (88 - 42)*ScreenScale/2, (42*3+10+36)*ScreenScale, 42*ScreenScale)];
        _giftNum.font = [UIFont systemFontOfSize:42*ScreenScale];
        _giftNum.textColor = ScreenRGB(255.0f, 58.0f, 155.0f);
        [self addSubview:_giftNum];
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
