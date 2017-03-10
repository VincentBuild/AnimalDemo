//
//  AnimalManage.m
//  AnimalTest
//
//  Created by VincentWe on 2016/12/12.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import "AnimalManage.h"
#import "AnimalOperation.h"

@interface AnimalManage ()  
/*
 ** 执行动画的位置  从下而上，0 1 2
 */
@property (assign, nonatomic) NSInteger locationIndex;
/*
 ** 存在三个动画模块  模板
 */
@property (strong, nonatomic) NSMutableArray * animalArray;

/**
 动画的位置
 */
@property (assign, nonatomic) NSInteger animalIndex;
@end

@implementation AnimalManage

-(id)init
{
    self = [super init];
    if (self) {
        _animalArray = [[NSMutableArray alloc]initWithCapacity:0];
        _animalIndex = 0;
        for (NSInteger i = 0; i<3; i++) {
            AnimalOperation * op = [[AnimalOperation alloc]init];
            op.isAnimal = NO;
            [_animalArray addObject:op];
        }
        
    }
    return self;
}
-(void)startAnimal:(NSString *)gift forUser:(NSString *)userId forGiftNums:(NSInteger)nums forView:(UIView *)view
{

    //判断数组中模板是否存在动画 进而判断是否有已存在的用户执行的动画
    BOOL isUserAnimal = false;
    for (AnimalOperation * op in _animalArray) {
        //判断是否有动画  并且符合当前用户条件
        if (op.isAnimal && [op.animalView.userID isEqualToString:userId]) {
            isUserAnimal = true;
            dispatch_async(dispatch_get_main_queue(), ^{
                //停止该模板动画
                [op stop];
                [op startAnimal:gift forUser:userId forGiftNums:nums];
                //直接执行礼物数量动画
                [op giftAnimal];
            });
            break;
        }
    }
    
    //判断是否已找到符合条件的动画
    if (!isUserAnimal) {
        //判断数组中模块是否存在动画
        BOOL isAnimal = true;
        for (AnimalOperation * op in _animalArray) {
            if (!op.isAnimal) {
                isAnimal = false;
            }
        }
        
        //如果全部存在动画 依次销毁动画(从下到上 对应模板数组0 1 2)  执行新动画
        if (isAnimal) {
            AnimalOperation * op = _animalArray[_animalIndex];
            [op stop];
            //删除该animalView的所有动画
            [op.animalView.layer removeAllAnimations];
            //销毁
            [op.animalView removeFromSuperview];
            op.animalView = nil;
            op.isAnimal = NO;
            op.preView = view;
            op.locationIndex = _animalIndex;
            [op startAnimal:gift forUser:userId forGiftNums:nums];
            //开启动画
            [op start];
            
            _animalIndex++;
            if (_animalIndex == 3) {
                _animalIndex = 0;
            }
        }else{  //如果有空位置  循环数组 发现空位置  直接放进去
            for (NSInteger i = 0; i<_animalArray.count; i++) {
                AnimalOperation * op = _animalArray[i];
                if (!op.isAnimal) {
                    //更改动画状态
                    op.isAnimal = YES;
                    op.preView = view;
                    op.locationIndex = i;
                    [op startAnimal:gift forUser:userId forGiftNums:nums];
                    _animalIndex = 0;
                    //开启动画
                    [op start];
                    break;
                }
            }
        }
    }
}


@end
