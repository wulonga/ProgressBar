//
//  ViewController.m
//  进度条
//
//  Created by mac on 2018/6/20.
//  Copyright © 2018年 Gooou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain) UIProgressView *progressView;
@property (nonatomic,retain) UILabel *label;
@property (nonatomic,retain) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建一个progress对象,有自己的初始化方法,创建的同时指定progress的样式,是个枚举,系统提供了2种样式
    self.progressView = [[UIProgressView alloc]initWithProgressViewStyle:(UIProgressViewStyleDefault)];
    //设置progress的frame,不用设置高度,设置的高度对进度条的高度没影响
    _progressView.frame = CGRectMake(20, 150, 280, 0);
    //2.2 设置轨道(未走过进度)的颜色
    _progressView.trackTintColor = [UIColor whiteColor];
    
    //2.3 设置进度条(已走过进度)的颜色
    _progressView.progressTintColor = [UIColor redColor];
    //3.添加到self.view
    [self.view addSubview:self.progressView];
    
    //创建一个定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressChanged) userInfo:nil repeats:YES];
    
    //调用label布局
    [self layoutLable];
    
}
- (void)layoutLable{
    self.label = [[UILabel alloc]initWithFrame:(CGRectMake(120, 200, 80, 40))];
    _label.backgroundColor = [UIColor greenColor];
    _label.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:self.label];
}
- (void)progressChanged{
    if (_progressView.progress >= 1.0) {
        [self.timer invalidate];
    }
    _progressView.progress += 0.01;
    
    //找一个float类型的变量接受当前progress的数值
    float progress = self.progressView.progress * 100;
    //使用接受的数值初始化一个字符串,用于label的显示
    NSString *string = [NSString stringWithFormat:@"%.1f%%",progress];
    _label.text = string;
    self.label.textAlignment = NSTextAlignmentCenter;
}


@end
