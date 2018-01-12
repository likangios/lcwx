//
//  LCActionRecommend.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionRecommend.h"
/*
 "data": {
 "gundong": [{
 "readTxt": "妃难从命：傲娇王爷请自重",
 "readLable": "",
 "batch": "20180108",
 "id": 46,
 "booktitle": "妃难从命：傲娇王爷请自重",
 "author": "千苒君笑",
 "cover": "/uploader/images/app/46.png"
 }, {
 "readTxt": "史上第一陷阱：冷少诱妻千千遍",
 "readLable": "",
 "batch": "20180108",
 "id": 6641,
 "booktitle": "史上第一陷阱：冷少诱妻千千遍",
 "author": "墨如罂",
 "cover": "/uploader/images/app/6641.png"
 }, {
 "readTxt": "报告总裁：你的挚爱刚离婚",
 "readLable": "",
 "batch": "20180108",
 */
@implementation LCActionRecommend
-(id) init
{
    self = [super initWithActionURLString:@"/api/BookStorage/Recommend"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
