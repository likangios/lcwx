//
//  LCActionSearch.h
//  lcwx
//
//  Created by macdev on 2018/1/12.
//  Copyright © 2018年 luck. All rights reserved.
//

#import "MSActionBase.h"
//搜索
@interface LCActionSearch : HIActionPostBase
-(id) initWithPageIndex:(NSNumber *)pageindex PageSize:(NSNumber *)pagesize Content:(NSString *)content；
@end
