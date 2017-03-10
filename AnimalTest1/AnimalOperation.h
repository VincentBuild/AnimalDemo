//
//  AnimalOperation.h
//  AnimalTest
//
//  Created by VincentWe on 2016/12/14.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimalView.h"

@interface AnimalOperation : NSObject
/*
 ** 动画模块
 */
@property (strong, nonatomic)AnimalView * animalView;
/*
 ** 执行动画的位置  从下而上，0 1 2
 */
@property (assign, nonatomic) NSInteger locationIndex;
/*
 **是否在动画
 */
@property (assign, nonatomic) BOOL isAnimal;
/*
 ** 页面载体
 */
@property (strong, nonatomic) UIView * preView;
/*
 ** 开始动画  传入  gift(礼物类型)  userId(用户ID) nums(礼物数量)
 */
-(void)startAnimal:(NSString *)gift forUser:(NSString *)userId forGiftNums:(NSInteger)nums;

/*
 **开启动画
 */
-(void)start;
/*
 **礼物数量动画
 */
-(void)giftAnimal;
/*
 **停止动画
 */
-(void)stop;
/*
 **礼物消失动画
 */
-(void)missAnimal;

@end
