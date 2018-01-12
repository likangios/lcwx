//
//  LCActionSearchHot.m
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "LCActionSearchHot.h"

@implementation LCActionSearchHot
/*
 {
 "data": {
 "book": [{
 "readTxt": "宠妻无度：boss约不约",
 "readLable": "",
 "batch": "20180111",
 "id": 9765,
 "tclass": "婚恋",
 "booktitle": "宠妻无度：boss约不约",
 "author": "金芝",
 "booklength": 881810,
 "state": 0,
 "cover": "/cover/9/9765.jpg",
 "lastUpdate": "2018-01-08 17:45:03",
 "lastUpdateTitle": "第364章 番外之好马吃了回头草（三）",
 "Introduction": "&nbsp;&nbsp;&nbsp;&nbsp;亲眼看了自己老公和闺蜜滚了床单之后，想要离婚竟然被下了药，莫名地把一个妖孽美男睡了。四年之后，带着宝宝回来的她，却被BOSS拦住。她知道，他想追究那天晚上的责任。“我也是受害者好吗？”“所以，你要抹去自己所有的责任是么？”“没有。”她怯怯地回答，心里有些惶恐，想绕过他，尽快逃离。“怎么，要跑是吗？”“不不不……”“那晚上约吗？”“约？约什么？”“你说约什么？”他轻抚着她的嘴唇，一脸邪魅的坏笑，“当然是滚床单了……”"
 }, {
 "readTxt": "宠狐成妃",
 "readLable": "",
 "batch": "20180111",
 "id": 9760,
 "tclass": "穿越",
 "booktitle": "宠狐成妃",
 "author": "花清舞",
 "booklength": 1630730,
 "state": 9,
 "cover": "/cover/9/9760.jpg",
 "lastUpdate": "2018-01-08 14:43:06",
 "lastUpdateTitle": "第七百六十九章    番外之终章",
 "Introduction": "&nbsp;&nbsp;&nbsp;&nbsp;从高级情报特工成了废柴小狐狸，童灵灵心里苦啊。被冷面王爷捡回家，还被赐婚成王妃？！原以为当了王妃就可吃香喝辣，没想到各种心机婊、伪白莲齐齐要害她！小狐狸炸毛了，别拿狐狸不当美女！看她左手音杀响遍大陆；右手炼丹制毒，震惊世界，顺道色遍天下美男。某王爷：色遍天下男人？小狐狸谄媚大笑：夫君，人家只色你一个。"
 }, {
 "readTxt": "诱爱；冷少宠妻成瘾",
 "readLable": "",
 "batch": "20180111",
 "id": 9740,
 "tclass": "豪门",
 "booktitle": "诱爱；冷少宠妻成瘾",
 "author": "雅瞳",
 "booklength": 1313421,
 "state": 9,
 "cover": "/cover/9/9740.jpg",
 "lastUpdate": "2018-01-05 14:06:25",
 "lastUpdateTitle": "430互相，陪伴到最后",
 "Introduction": "&nbsp;&nbsp;&nbsp;&nbsp;第一次见面，她被男友设计，失身给冷氏集团的总裁。第二次见面，他强行将她掳走，只是想知道，为何一夜欢愉，她留下一把零钱。他，堂堂冷氏集团的总裁，冷漠，傲娇，不轻易对女人动情，对她却是念念不忘。她，刚刚毕业的大学生，向往美好的生活，却因为男友的设计，失身于她。从此，他便缠上她，无礼的要她陪在自己身边，没有婚礼，只是一张契约，并且答应她可以揪出那个混账男友。只是不知道，在这场契约里，她到底是失了身，还是彻底的失了心。"
 }],
 "hot": "总裁;穿越;闪婚;职场;腹黑;婚后;王妃;重生"
 },
 "Success": true,
 "Token": "1867e1244c7f5acbfe9fc56cabe05859,3509796,1515749857",
 "Total": 0,
 "Message": "操作成功",
 "Code": 0,
 "Version": "4.0.4"
 }
 */
-(id) init
{
    self = [super initWithActionURLString:@"/api/BookStorage/SearchHot"];
    if( self )
    {
        self.parameters = [NSMutableDictionary dictionary];
    }
    [self addBaseParameters];
    self.isValid = YES;
    
    return self;
}
@end
