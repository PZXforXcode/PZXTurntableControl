//
//  PZXTurntableView.h
//  PZXTurntableControl
//
//  Created by xrkj on 2018/7/11.
//  Copyright © 2018年 pengzuxin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TurntableViewDelegate <NSObject>

- (void)TurnTableViewDidFinishWithIndex:(NSInteger)index;

@end
@interface PZXTurntableView : UIView

@property (nonatomic,assign) NSInteger numberIndex;

@property (nonatomic,strong) UIButton * playButton;      // 抽奖按钮

@property (nonatomic,strong) UIImageView * rotateWheel;  // 转盘背景

@property (nonatomic,strong) NSArray * numberArray;      // 存放奖励

@property (nonatomic,assign) id <TurntableViewDelegate>delegate;

@end
