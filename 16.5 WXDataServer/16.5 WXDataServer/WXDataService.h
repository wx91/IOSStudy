//
//  WXDataService.h
//  16.5 WXDataServer
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^Completion)(id);

@interface WXDataService : NSObject

+(void)getWeatherData:(NSDictionary *)params block:(Completion *)block;



@end
