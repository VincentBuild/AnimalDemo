//
//  AnimalOperation.m
//  AnimalTest
//
//  Created by VincentWe on 2016/12/14.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import "AnimalOperation.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width         //屏幕宽
#define ScreenHeight [UIScreen mainScreen].bounds.size.height       //屏幕高
#define ScreenScale [UIScreen mainScreen].bounds.size.width/375/2 //页面布局尺寸比例
#define ScreenRGB(x,y,z) [UIColor colorWithRed:x/255.0f green:y/255.f blue:z/255.0f alpha:1.0f] //RGB颜色值
#define ScreenAnimalViewWidth (30+280+30+42*3+10)*ScreenScale

@interface AnimalOperation ()

@end

@implementation AnimalOperation


-(void)setLocationIndex:(NSInteger)locationIndex
{
    _locationIndex = locationIndex;
    if (_locationIndex == 0) {
        _animalView = [[AnimalView alloc]initWithFrame:CGRectMake(-ScreenAnimalViewWidth, 200, ScreenAnimalViewWidth, 88*ScreenScale)];
    }else if (_locationIndex == 1){
        _animalView = [[AnimalView alloc]initWithFrame:CGRectMake(-ScreenAnimalViewWidth, 200-88*ScreenScale, ScreenAnimalViewWidth, 88*ScreenScale)];
    }else{
        _animalView = [[AnimalView alloc]initWithFrame:CGRectMake(-ScreenAnimalViewWidth, 200-2*88*ScreenScale, ScreenAnimalViewWidth, 88*ScreenScale)];
    }
}

-(void)startAnimal:(NSString *)gift forUser:(NSString *)userId forGiftNums:(NSInteger)nums
{
    _animalView.userID = userId;
    _animalView.userName.text = userId;
    _animalView.tag += nums;
    _animalView.giftNum.numLabel.text = [NSString stringWithFormat:@"%@",@(_animalView.tag)];
    if (![self.preView.subviews containsObject:_animalView]) {
        [self.preView addSubview:_animalView];
    }
    
}


#pragma mark --------------------  开启动画
-(void)start
{
    [UIView animateWithDuration:0.5 animations:^{
        self.isAnimal = YES;
        _animalView.frame = CGRectMake(0, _animalView.frame.origin.y, ScreenAnimalViewWidth, _animalView.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            [self giftAnimal];
        }
    }];
}
#pragma mark --------------------  礼物数量动画
-(void)giftAnimal
{
    [UIView animateWithDuration:0.2 animations:^{
        self.isAnimal = YES;
        _animalView.giftNum.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.2 animations:^{
                _animalView.giftNum.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
                if (finished) {
                    [self performSelector:@selector(missAnimalClick) withObject:nil afterDelay:3.0];
                }
            }];
        }
    }];
}
#pragma mark -------------------  动画停止
-(void)stop
{
    //取消延时加载
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(missAnimalClick) object:nil];
    //移除所有动画
    [_animalView.layer removeAllAnimations];
}
#pragma mark --------------------  礼物消失动画
-(void)missAnimal
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            _animalView.alpha = 0;
        } completion:^(BOOL finished) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.isAnimal = NO;
                [_animalView removeFromSuperview];
                _animalView = nil;
            });
        }];
    });
}
#pragma mark --------------------  延迟加载事件
-(void)missAnimalClick
{
    [self missAnimal];
}
@end
