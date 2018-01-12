//
//  LCActionBookCharts.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"
//榜单
@interface LCActionBookCharts : HIActionPostBase

// type  1:畅销， 8：人气，3：推荐，7：收藏，2月票，6打赏，4完本，5免费
-(id) initWithPageIndex:(NSNumber *)pageindex PageSize:(NSNumber *)pagesize Type:(NSNumber *)type Oid:(NSString *)oid;
@end
