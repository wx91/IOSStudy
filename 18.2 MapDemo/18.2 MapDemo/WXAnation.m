//
//  WXAnation.m
//  18.2 MapDemo
//
//  Created by wangx on 15/7/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "WXAnation.h"
#import <MapKit/MapKit.h>

@implementation WXAnation
@synthesize coordinate,title,subtitle;
-(instancetype)initWithCoordinate2D:(CLLocationCoordinate2D )coordinate{
    self=[super init];
    if (self) {
        coordinate=coordinate;
    }
    return self;
}
@end
