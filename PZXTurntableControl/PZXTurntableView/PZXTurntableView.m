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



@interface PZXTurntableView() <CAAnimationDelegate>

@property(nonatomic,assign)NSInteger num;

@end





@implementation PZXTurntableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _num = 0;
        [self initUI];
        
    }
    return self;
}


-(void)initUI{
    
    
    // 转盘
    self.rotateWheel = [[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:self.rotateWheel];
    self.rotateWheel.image = [UIImage imageNamed:@"BGTEST03"];
    
    // 抽奖按钮
    self.playButton = [[UIButton alloc]initWithFrame:
                       CGRectMake(0,
                                  0,
                                  CGRectGetWidth(self.bounds)/3,
                                  CGRectGetHeight(self.bounds)/3)];
    self.playButton.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetWidth(self.bounds)/2);
    self.playButton.layer.cornerRadius = CGRectGetWidth(self.bounds)/3/2;
    [self.playButton addTarget:self action:@selector(playButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.playButton];
    
    // 外围装饰背景图
    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 80)];
    backImageView.image = [UIImage imageNamed:@"wheel_needle"];
    [self addSubview:backImageView];
    
    backImageView.center = self.center;

    
    // 在转盘上添加图片和文字
//    NSArray * imageArray = @[@"qiandao_0000_000",@"qiandao_0001_001",@"qiandao_0002_003",@"qiandao_0003_01",@"qiandao_0004_02",@"qiandao_0000_000",@"2000",@"qiandao_0003_01"];
    
//    _numberArray = @[@"500(1)",@"2000(2)",@"5000(3)",@"一束鲜花(4)",@"20000(5)",@"500(6)",@"2000(7)",@"一束鲜花(8)"];
    
    for (int i = 0; i < 8; i ++) {
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,M_PI * CGRectGetHeight(self.bounds)/8,
//                                                                  CGRectGetHeight(self.bounds)/2)];
//        label.layer.anchorPoint = CGPointMake(0.5, 1);
//        label.center = CGPointMake(CGRectGetHeight(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
//        label.text = [NSString stringWithFormat:@"%@", _numberArray[i]];
//        CGFloat angle = M_PI * 2 / 8 * i;
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:10];
//        label.transform = CGAffineTransformMakeRotation(angle);
//        [self.rotateWheel addSubview:label];
//
//        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35*turnScale_W, 12, M_PI * CGRectGetHeight(self.bounds)/8 - 65*turnScale_W, 45*turnScale_H)];
//        imageView.image = [UIImage imageNamed:imageArray[i]];
//        [label addSubview:imageView];
//
    }

}
-(void)setNumberArray:(NSArray *)numberArray{
    
    _numberArray = numberArray;
    for (int i = 0; i < [_numberArray count]; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,M_PI * CGRectGetHeight(self.bounds)/8,
                                                                  CGRectGetHeight(self.bounds)/2)];//Y是半径设置
        label.layer.anchorPoint = CGPointMake(0.5, 1);
        label.center = CGPointMake(CGRectGetHeight(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
        label.text = [NSString stringWithFormat:@"%@", _numberArray[i]];
        CGFloat angle = M_PI * 2 / 8 * i;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        label.transform = CGAffineTransformMakeRotation(angle);
        [self.rotateWheel addSubview:label];
        
//        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35*turnScale_W, 12, M_PI * CGRectGetHeight(self.bounds)/8 - 65*turnScale_W, 45*turnScale_H)];
//        imageView.image = [UIImage imageNamed:imageArray[i]];
//        [label addSubview:imageView];
        
    }
    
    
}

-(void)playButtonPressed:(UIButton *)sender{
    
    [self startAnimaition];
}
-(void)startAnimaition
{
    _playButton.userInteractionEnabled = NO;
    NSInteger turnAngle;
    NSInteger randomNum = arc4random()%100;//控制概率
    NSInteger turnsNum = arc4random()%5+1;//控制圈数
    
    if (randomNum>=0 && randomNum<20) {//80%的概率 就是0-80
        
        if (randomNum < 40) {
            
            turnAngle = 0;
            _num = 1;
            
        }else{
            
            turnAngle = 135;
            _num = 6;

        }
        NSLog(@"抽中了500");
        
    } else if (randomNum>=20 && randomNum<40) {
        
        if (randomNum < 75) {
            
            turnAngle = 45;
            _num = 8;

            
        }else{
            
            turnAngle = 225;
            _num = 4;

        }
        NSLog(@"抽中了鲜花");
        
    } else if (randomNum >=40 && randomNum<60) {
        
        turnAngle = 315;
        _num = 2;

        NSLog(@"抽中了2000");
        
    } else if(randomNum >=60 && randomNum<80){
        
        if (randomNum < 95) {
            
            turnAngle = 90;
            _num = 7;

        }else{
            
            turnAngle = 270;
            _num = 3;

        }
        NSLog(@"抽中了5000");
        
    }else{
        
        turnAngle = 180;
        _num = 5;
        NSLog(@"抽中了20000");
    }
    

    
    CGFloat perAngle = M_PI/180.0;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:turnAngle * perAngle + 360 * perAngle * turnsNum];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.delegate = self;
    //由快变慢
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.fillMode=kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    [self.rotateWheel.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // 转盘结束后调用，显示获得的对应奖励
    //    self.label.text = [NSString stringWithFormat:@"恭喜您抽中%@",self.labelText];
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    NSLog(@"over %ld",(long)_num);
    _playButton.userInteractionEnabled = YES;
    [self.delegate TurnTableViewDidFinishWithIndex:_num];
    
    
}
@end
