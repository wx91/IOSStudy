//
//  ViewController.m
//  18.2 MapDemo
//
//  Created by wangx on 15/7/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "WXAnation.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MKMapView *mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    //设置代理
    mapView.delegate=self;
    //设置是否显示用户当前位置
    mapView.showsUserLocation=YES;
    //设置地图显示类型
    mapView.mapType=MKMapTypeStandard;
    //经纬度
    CLLocationCoordinate2D coord2D={39.910650,116.47030};
    //显示经纬度范围
    MKCoordinateSpan span={0.1,0.1};
    //显示区域
    MKCoordinateRegion region={coord2D,span};
    //给地图设置显示区域
    [mapView setRegion:region animated:YES];
    //将地图添加到根视图上
    [self.view addSubview:mapView];
    
    //创建Anation对象
    CLLocationCoordinate2D showcoord1={39.911650,116.47130};
    //初始化自定义Annotation，并给定一个位置
    WXAnation *anation1=[[WXAnation alloc]initWithCoordinate2D:showcoord1];
    //设置标题
    anation1.title=@"万达电影院";
    //设置子标题
    anation1.subtitle=@"小标题";
    //将Annotation添加到地图上
    [mapView addAnnotation:anation1];
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //判断时候为当前设备位置的annotation
    //使用大头针作为标准视图
    static NSString *identifier=@"Annation";
    //复用标注视图
    MKPinAnnotationView *annotionView=(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotionView==nil) {
        annotionView=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    //判断是否为自定义标注视图
    if ([annotation isKindOfClass:[WXAnation class]]) {
        pinv
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
