//
//  LCActionInit.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionInit.h"

@implementation LCActionInit
/*
 {
 "data": {
 "items": [{
 "id": 7301,
 "isVip": true,
 "tclass": "婚恋",
 "cover": "/cover/7/7301.jpg",
 "author": "谨羽",
 "booktitle": "二婚老婆带回家：你好，坏先生",
 "booklength": 1539731,
 "state": 0,
 "cid": 0,
 "lastUpdateTitle": "第748章 平安回来",
 "lastUpdate": "2018-01-12 12:12:00",
 "lastUpdateId": 2364362
 }],
 "hot": [{
 "readTxt": "二婚老婆带回家：你好，坏先生",
 "readLable": "",
 "batch": "20180111",
 "id": 7301,
 "tclass": "婚恋",
 "booktitle": "二婚老婆带回家：你好，坏先生",
 "author": "谨羽",
 "booklength": 1539731,
 "state": 0,
 "cover": "/cover/7/7301.jpg",
 "updateTitle": "第748章 平安回来",
 "updateTime": "2018-01-12 12:12:00",
 "vipUpdateTitle": "第748章 平安回来",
 "vipUpdateTime": "2018-01-12 11:39:28",
 "lastUpdate": "2018-01-12 12:12:00",
 "Introduction": "老公为升职不折手段，婚内出轨，教唆婆婆害我流产，万念俱灰下我为复仇勾引...",
 "lastUpdateTitle": "第748章 平安回来"
 }, {
 "readTxt": "凤凰醉：邪君盛宠杀手妃",
 "readLable": "",
 "batch": "20180111",
 "id": 8376,
 "tclass": "玄幻",
 "booktitle": "凤凰醉：邪君盛宠杀手妃",
 "author": "扶玉 ",
 "booklength": 775067,
 "state": 0,
 "cover": "/cover/8/8376.jpg",
 "updateTitle": "第24章：这里是辰安王府",
 "updateTime": "2017-12-28 13:03:14",
 "vipUpdateTitle": "第377章：生了一个死胎",
 "vipUpdateTime": "2018-01-12 12:00:29",
 "lastUpdate": "2018-01-12 12:00:29",
 "Introduction": "她是21世纪最强异能特工，美艳绝伦，生杀矛夺，是令人闻之色变的死神。一朝...",
 "lastUpdateTitle": "第377章：生了一个死胎"
 }, {
 "readTxt": "倾世独宠：病妃太撩人",
 "readLable": "",
 "batch": "20180111",
 "id": 8709,
 "tclass": "穿越",
 "booktitle": "倾世独宠：病妃太撩人",
 "author": "莫九九",
 "booklength": 415629,
 "state": 0,
 "cover": "/cover/8/8709.jpg",
 "updateTitle": "第202章  本王负责动",
 "updateTime": "2018-01-11 20:55:52",
 "vipUpdateTitle": "第203章   满身的吻痕",
 "vipUpdateTime": "2018-01-11 22:28:29",
 "lastUpdate": "2018-01-12 09:40:36",
 "Introduction": "她与他在死人堆醒来，几日相处暗生情愫，奈何她肩负重任决定各安天涯！再次...",
 "lastUpdateTitle": "第203章   满身的吻痕"
 }]
 },
 "Success": true,
 "Token": "3606ade817ef828f7ec37e7d8825cbf1,3509796,1515738737",
 "Total": 0,
 "Message": "操作成功",
 "Code": 0,
 "Version": "4.0.4"
 }
 */
-(id) initWithIsFir:(NSNumber *)isfir
{
    self = [super initWithActionURLString:@"/api/BookCase/Init"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
        [self.parameters setObject:isfir forKey:@"isfir"];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
