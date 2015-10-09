//
//  AppDelegate.m
//  18.1 LocationDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.frame=CGRectMake(50, 150, 100, 30);
//    [button setTitle:@"开始定位" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(LocationAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:button];
    
    CLLocationManager *locationManager=[[CLLocationManager alloc]init];
    //设置过滤信息
    //    [locationManager setDistanceFilter:kCLDistanceFilterNone ];
    //设置定位精度
    [locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    locationManager.delegate=self;
    //开始实时定位
    [locationManager startUpdatingLocation];

    return YES;
}
//-(void)LocationAction{
//
//}
//实时定位调用的方法
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    CLLocationCoordinate2D coordinate=newLocation.coordinate;
    NSLog(@"经度:%f,纬度：%f",coordinate.latitude,coordinate.longitude);
    [manager stopUpdatingLocation];
    //计算两个位置的距离
//    float distance=[newLocation distanceFromLocation:oldLocation];
//    NSLog(@"%f",distance);
    
//    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
//    [geocoder reverseGeocodeLocation:newLocation
//                   completionHandler:^(NSArray *placemarks,
//                                       NSError *error) {
//                       for (CLPlacemark *placemark in placemarks) {
//                           NSLog(@"name,%@",placemark.name);//位置名
//                           NSLog(@"thoroughfare,%@",placemark.thoroughfare);//街道
//                           NSLog(@"subThoroughfare,%@",placemark.subThoroughfare);//子街道
//                           NSLog(@"locality,%@",placemark.locality);//市
//                           NSLog(@"subLocality,%@",placemark.subLocality);//区
//                           NSLog(@"country,%@",placemark.country);//国家
//                       }
//    }];
    CLLocationCoordinate2D coord2D=CLLocationCoordinate2DMake(39.91065, 116.4703);
    MKReverseGeocoder *geocoder=[[MKReverseGeocoder alloc]initWithCoordinate:coordinate];
    geocoder.delegate=self;
    [geocoder start];
    
    
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
    NSLog(@"name,%@",placemark.name);//位置名
    NSLog(@"thoroughfare,%@",placemark.thoroughfare);//街道
    NSLog(@"subThoroughfare,%@",placemark.subThoroughfare);//子街道
    NSLog(@"locality,%@",placemark.locality);//市
    NSLog(@"subLocality,%@",placemark.subLocality);//区
    NSLog(@"country,%@",placemark.country);//国家
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    for(CLLocation *location in locations){
        NSLog(@"%@",location);
//        NSLog(@"经度:%f,纬度：%f",coordinate.latitude,coordinate.longitude);
    }
    [manager stopUpdatingLocation];
}

//- (void)locationManager:(CLLocationManager *)manager
//     didUpdateLocations:(NSArray *)locations{
//    
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
