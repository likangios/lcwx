
//  LCSegmentView.h
//  DouBo_Live
//
//  Created by macdev on 2018/1/15.
//  Copyright © 2018年 ngmob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSegmentView : UIView

@property (nonatomic,copy) void (^btnClickBlock)(NSInteger index);//index：从1开始
@property (nonatomic,assign) NSInteger defaultIndex;//从1开始
- (instancetype)initWithFrame:(CGRect)frame WithTitles:(NSArray *)titles;
@end
