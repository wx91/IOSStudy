//
//  MainViewController.m
//  18.2 MapDemo
//
//  Created by wangx on 15/7/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"
#import "WXAnation.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //是否显示当前设备的位置
    self.mapView.showsUserLocation=YES;
    
    MKMapView *mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    //设置代理
    self.mapView.delegate=self;
    //设置是否显示用户当前位置
    self.mapView.showsUserLocation=YES;
    
    //地图的显示类型
    /* 
     MKMapTypeStandard      标准地图
     MKMapTypeSatellite     卫星地图
     MKMapTypeHybrid        混合地图
     */
    self.mapView.mapType=MKMapTypeStandard;
    //坐标，这是地图初始化的时候显示的坐标
    CLLocationCoordinate2D coord2D={39.910650,116.47030};
    //显示的返回。数值越大，范围越大
    MKCoordinateSpan span={0.1,0.1};
    MKCoordinateRegion region={coord2D,span};
    //地图初始化的时候显示的区域
    [self.mapView setRegion:region];
    //是否允许缩放
//    self.mapView.zoomEnabled=NO;
//    self.mapView.scrollEnabled=NO;
    
    //创建Anation对象
    CLLocationCoordinate2D showcoord1={39.911650,116.47130};
    //初始化自定义Annotation，并给定一个位置
    WXAnation *anation1=[[WXAnation alloc]initWithCoordinate2D:showcoord1];
    //设置标题
    anation1.title=@"万达电影院";
    //设置子标题
    anation1.subtitle=@"小标题";
    //将Annotation添加到地图上
    [self.mapView addAnnotation:anation1];
    
     CLLocationCoordinate2D showcoord2={39.912650,116.47230};
    WXAnation *anation2=[[WXAnation alloc]initWithCoordinate2D:showcoord2];
    anation2.title=@"万达电影院2";
    anation2.subtitle=@"小标题2";
    [self.mapView addAnnotation:anation2];
    
    [self.view addSubview:self.mapView];
    
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    //当前经纬度
    CLLocationCoordinate2D coord2D=newLocation.coordinate;
    NSLog(@"%f,%f",coord2D.latitude,coord2D.longitude);
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations{
    CLLocation *location=(CLLocation *)[locations lastObject];
    //获取经纬度
    CLLocationCoordinate2D coord2D=location.coordinate;
    //取得精度
    CLLocationAccuracy horizontal=location.horizontalAccuracy;
    CLLocationAccuracy vertical=location.verticalAccuracy;
    //获取高度
    CLLocationDistance altitude=location.altitude;
    //取得时刻
    NSDate *timestamo=[location timestamp];
    //取得两个位置间的距离
    CLLocationDistance distance=[location distanceFromLocation:location];
    
    NSLog(@"%f,%f",coord2D.latitude,coord2D.longitude);
    [manager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark  MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation{
    
    //判断时候为当前设备位置的annotation
    //使用大头针作为标准视图
    static NSString *identifier=@"Annation";
    MKPinAnnotationView *annotionView=(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotionView==nil) {
        annotionView=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        //设置是否显示标题视图
        annotionView.canShowCallout=YES;
        UIButton *button=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(ButtonAction) forControlEvents:UIControlEventTouchUpInside];
        //标题左边视图
        annotionView.leftCalloutAccessoryView=button;
        //标题右边视图
//        annotionView.rightCalloutAccessoryView=button;
    }
    if ([annotation isKindOfClass:[WXAnation class]]) {
        annotionView.pinColor=MKPinAnnotationColorPurple;
        annotionView.canShowCallout=YES;
        UIButton *button=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(ButtonAction) forControlEvents:UIControlEventTouchUpInside];
        //标题左边视图
        annotionView.leftCalloutAccessoryView=button;
        annotionView.animatesDrop=YES;
        annotionView.annotation=annotation;
    }else{
        return nil;
    }
    //设置大头针的颜色
    annotionView.pinColor=MKPinAnnotationColorRed;
    //大头针从天上掉下来的动画
    annotionView.animatesDrop=YES;
    
    
    /*
    //使用图片作为标注视图
    static NSString *identifier=@"Annation";
    MKAnnotationView *annotionView=[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotionView==nil) {
        annotionView=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        annotionView.image=[UIImage imageNamed:@"play"];
        
        //设置是否显示标题视图
        annotionView.canShowCallout=YES;
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(ButtonAction) forControlEvents:UIControlEventTouchUpInside];
        //标题右边视图
        annotionView.rightCalloutAccessoryView=button;
    }
     */
    return annotionView;
}
-(void)ButtonAction{
    NSLog(@"显示电影院详情");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
