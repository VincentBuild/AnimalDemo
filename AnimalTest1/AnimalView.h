//
//  AnimalView.h
//  AnimalTest
//
//  Created by VincentWe on 2016/12/12.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalLabel.h"


@interface AnimalView : UIView
/*
 **背景
 */
@property (strong, nonatomic) UIView * bgView;
/*
 **礼物图片
 */
@property (strong, nonatomic) UIImageView * img;
/*
 **礼物数量 
 */
@property (strong, nonatomic) AnimalLabel * giftNum;
/*
 **礼物种类
 */
@property (strong, nonatomic) UILabel * giftType;
/*
 **用户名称
 */
@property (copy, nonatomic) UILabel * userName;
/*
 **用户ID
 */
@property (copy, nonatomic) NSString * userID;
/*
 **是否在动画
 */
@property (assign, nonatomic) BOOL isAnimal;
/*
 **定时器
 */
@property (strong, nonatomic) NSTimer * myTime;
@end

