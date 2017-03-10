//
//  ViewController.m
//  AnimalTest1
//
//  Created by VincentWe on 2016/12/26.
//  Copyright © 2016年 VincentWe. All rights reserved.
//

#import "ViewController.h"
#import "AnimalManage.h"

@interface ViewController ()
/*
 ** 弹幕礼物动画管理类
 */
@property (strong, nonatomic) AnimalManage * animalManage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //调用AnimalManage 初始化
    _animalManage = [[AnimalManage alloc]init];
}
- (IBAction)buttonClick:(UIButton *)sender {
    NSString * temp;
    switch (sender.tag) {
        case 1:    //🍎
        {
            temp = @"赵一";
        }
            break;
        case 2:    //🍌
        {
            temp = @"钱二";
        }
            break;
        case 3:     //🍊
        {
            temp = @"孙三";
        }
            break;
        case 4:     //🍇
        {
            temp = @"李四";
        }
            break;
        case 5:     //🍉
        {
            temp = @"周五";
        }
            break;
        default:    //💎
        {
            temp = @"吴六";
        }
            break;
    }
    //开始动画
    [_animalManage startAnimal:temp forUser:temp forGiftNums:2 forView:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
