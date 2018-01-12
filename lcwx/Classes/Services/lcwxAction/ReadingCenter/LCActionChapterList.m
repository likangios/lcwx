//
//  LCActionChapterList.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionChapterList.h"
/*
 {
 "data": [{
 "id": 13147,
 "volumeTitle": "正文",
 "volumeOrder": 100,
 "volumeLenght": 1539731,
 "chapters": [{
 "id": 1579983,
 "volumeTitle": "正文",
 "chargeLength": 2451,
 "Title": "第1章 天台自杀",
 "Orders": 0,
 "chapterMoney": 0,
 "lastUpdate": "2017-08-04",
 "isVip": false,
 "NextID": 1583307,
 "PrevID": 0
 }, {
 "id": 1583307,
 "volumeTitle": "正文",
 "chargeLength": 2048,
 "Title": "第2章 男人的那些龌蹉事",
 "Orders": 1,
 "chapterMoney": 0,
 */
@implementation LCActionChapterList
-(id) initWithBid:(NSString *)bid
{
    self = [super initWithActionURLString:@"/api/ReadingCenter/ChapterList"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:bid forKey:@"bid"];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
