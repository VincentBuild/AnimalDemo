//
//  AnimalManage.h
//  AnimalTest
//
//  Created by VincentWe on 2016/12/12.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimalView.h"

@interface AnimalManage : NSObject

/*
 ** 开始动画  传入  gift(礼物类型)  userId(用户ID) nums(礼物数量)
 */
-(void)startAnimal:(NSString *)gift forUser:(NSString *)userId forGiftNums:(NSInteger)nums forView:(UIView *)view;

@end
