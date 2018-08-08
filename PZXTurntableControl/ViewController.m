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

@interface ViewController ()<CAAnimationDelegate,TurntableViewDelegate>

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
    self.turntable.numberArray = @[@"500(1)",@"2000(2)",@"5000(3)",@"一束鲜花(4)",@"20000(5)",@"500(6)",@"5000(7)",@"一束鲜花(8)"];

//    [self.turntable.playButton addTarget:self action:@selector(startAnimaition) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.turntable];
}

-(void)TurnTableViewDidFinishWithIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
    
}




@end
