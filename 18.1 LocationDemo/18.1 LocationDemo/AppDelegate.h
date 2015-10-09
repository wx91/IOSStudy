//
//  AppDelegate.h
//  18.1 LocationDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate,MKReverseGeocoderDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

