//
//  MainViewController.m
//  12.1 PickerViewDemo
//
//  Created by wangx on 15/6/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

-(void)loadView{
    [super loadView];
    UIPickerView *pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 460-216, 0, 0)];
    pickerView.delegate=self;
    pickerView.dataSource=self;
    [self.view addSubview:pickerView];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"city" ofType:@"plist"];
    data=[[NSArray alloc]initWithContentsOfFile:path];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma marker UIPickerView Delegate
//返回有列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//返回每一列中的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component==0) {
        return  data.count;
    }
    //返回第一列选中的行的的索引
    NSInteger selectedRow=[pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *items=[data objectAtIndex:selectedRow];
    //取得省下面所有的市
    NSArray *cites=[items objectForKey:@"cities"];
    return cites.count;
}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    if (component==0) {
//        NSDictionary *dic = [data objectAtIndex:row];
//        NSString *state=[dic objectForKey:@"state"];
//        return  state;
//    }else{
//        NSInteger selectedRow=[pickerView selectedRowInComponent:0];
//        //取得省级字典
//        NSDictionary *items=[data objectAtIndex:selectedRow];
//        //取得省下面所有的市
//        NSArray *cites=[items objectForKey:@"cities"];
//        NSString *cityname=[cites objectAtIndex:row];
//        return cityname;
//    }
//}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        //根据省份刷新城市
        [pickerView reloadComponent:1];
        //选择到第一行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}
//设置列的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component==0) {
        return 100;
    }
    return 220;
}
//自定义行显示的view
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component==0) {
        NSDictionary *dic = [data objectAtIndex:row];
        NSString *state=[dic objectForKey:@"state"];
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        view.backgroundColor=[UIColor grayColor];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        label.text=state;
        [view addSubview:label];
        return  view;
    }else{
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 220, 40)];
        view.backgroundColor=[UIColor redColor];
        NSInteger selectedRow=[pickerView selectedRowInComponent:0];
        //取得省级字典
        NSDictionary *items=[data objectAtIndex:selectedRow];
        //取得省下面所有的市
        NSArray *cites=[items objectForKey:@"cities"];
        NSString *cityname=[cites objectAtIndex:row];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 220, 30)];
        label.text=cityname;
        [view addSubview:label];
        return view;
    }
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
