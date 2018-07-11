//
//  PZXTurntableView.m
//  PZXTurntableControl
//
//  Created by xrkj on 2018/7/11.
//  Copyright © 2018年 pengzuxin. All rights reserved.
//

#import "PZXTurntableView.h"

#define turnScale_W self.bounds.size.width/300
#define turnScale_H self.bounds.size.height/300

@implementation PZXTurntableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI{
    
    
    // 转盘
    self.rotateWheel = [[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:self.rotateWheel];
    self.rotateWheel.image = [UIImage imageNamed:@"BGTEST01"];
    
    // 抽奖按钮
    self.playButton = [[UIButton alloc]initWithFrame:
                       CGRectMake(0,
                                  0,
                                  CGRectGetWidth(self.bounds)/3,
                                  CGRectGetHeight(self.bounds)/3)];
    self.playButton.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetWidth(self.bounds)/2);
    self.playButton.layer.cornerRadius = CGRectGetWidth(self.bounds)/3/2;
    [self addSubview:self.playButton];
    
    // 外围装饰背景图
    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 80)];
    backImageView.image = [UIImage imageNamed:@"wheel_needle"];
    [self addSubview:backImageView];
    
    backImageView.center = self.center;
//    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.rotateWheel.mas_centerX).with.offset(-1*turnScale_W);
//        make.centerY.mas_equalTo(self.rotateWheel.mas_centerY).with.offset(-13*turnScale_H);
//        make.size.mas_equalTo(CGSizeMake(330*turnScale_W, 345*turnScale_H));
//    }];
    
    // 在转盘上添加图片和文字
    NSArray * imageArray = @[@"qiandao_0000_000",@"qiandao_0001_001",@"qiandao_0002_003",@"qiandao_0003_01",@"qiandao_0004_02",@"qiandao_0000_000",@"2000",@"qiandao_0003_01"];
    
    _numberArray = @[@"500(1)",@"2000(2)",@"5000(3)",@"一束鲜花(4)",@"20000(5)",@"500(6)",@"2000(7)",@"一束鲜花(8)"];
    
    for (int i = 0; i < 8; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,M_PI * CGRectGetHeight(self.bounds)/8,
                                                                  CGRectGetHeight(self.bounds)/2)];
        label.layer.anchorPoint = CGPointMake(0.5, 1);
        label.center = CGPointMake(CGRectGetHeight(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
        label.text = [NSString stringWithFormat:@"%@", _numberArray[i]];
        CGFloat angle = M_PI * 2 / 8 * i;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        label.transform = CGAffineTransformMakeRotation(angle);
        [self.rotateWheel addSubview:label];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35*turnScale_W, 12, M_PI * CGRectGetHeight(self.bounds)/8 - 65*turnScale_W, 45*turnScale_H)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [label addSubview:imageView];
        
    }
    
}

@end
