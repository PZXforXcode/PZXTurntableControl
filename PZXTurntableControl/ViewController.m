//
//  ViewController.m
//  PZXTurntableControl
//
//  Created by xrkj on 2018/7/11.
//  Copyright © 2018年 pengzuxin. All rights reserved.
//

#import "ViewController.h"
#import "PZXTurntableView.h"
#define screenW self.view.bounds.size.width

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic,strong) PZXTurntableView * turntable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 转盘View
    self.turntable = [[PZXTurntableView alloc] initWithFrame:CGRectMake(0, 0, screenW-50, screenW-50)];
    self.turntable.center = self.view.center;
    [self.turntable.playButton addTarget:self action:@selector(startAnimaition) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.turntable];
}


-(void)startAnimaition
{
    NSInteger turnAngle;
    NSInteger randomNum = arc4random()%100;//控制概率
    NSInteger turnsNum = arc4random()%5+1;//控制圈数
    
    if (randomNum>=0 && randomNum<20) {//80%的概率 就是0-80
        
        if (randomNum < 40) {
            
            turnAngle = 0;
            
        }else{
            
            turnAngle = 135;
            
        }
        NSLog(@"抽中了500");
        
    } else if (randomNum>=20 && randomNum<40) {
        
        if (randomNum < 75) {
            turnAngle = 45;
        }else{
            turnAngle = 225;
        }
        NSLog(@"抽中了鲜花");
        
    } else if (randomNum >=40 && randomNum<60) {
        
        turnAngle = 315;
        NSLog(@"抽中了2000");
        
    } else if(randomNum >=60 && randomNum<80){
        
        if (randomNum < 95) {
            
            turnAngle = 90;
            
        }else{
            
            turnAngle = 270;
            
        }
        NSLog(@"抽中了5000");
        
    }else{
        
        turnAngle = 180;
        NSLog(@"抽中了20000");
    }
    
    //    NSLog(@"randomNum = %ld , angle = %ld , turnsNum = %ld",randomNum,turnAngle,turnsNum);
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
    [self.turntable.rotateWheel.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    // 转盘结束后调用，显示获得的对应奖励
//    self.label.text = [NSString stringWithFormat:@"恭喜您抽中%@",self.labelText];
    
}


@end
