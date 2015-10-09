//
//  RootViewController.m
//  FontTableViewDemo
//
//  Created by wangx on 15/5/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadView{
    UIView *view=[[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view=view;
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"ListData" ofType:@"plist"];
     _dataDic=[NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *keyArray=[NSArray arrayWithArray:[_dataDic allKeys]];
    
    //排序
    _keyArray =[keyArray sortedArrayUsingSelector:@selector(compare:)];
    
    _tableView =[[UITableView alloc]initWithFrame:view.bounds style:UITableViewStyleGrouped ];
    
    _tableView.dataSource=self;//设置数据源，并实现数据源需要实现的方法
    _tableView.delegate=self;//设置委托方法
    [self.view addSubview:_tableView];
    
    
}

//表示图中有多少个selection 默认是为1
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return [_keyArray count];
 }
 
#pragma mark TableView DataSource
//section中的row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *data=[_dataDic objectForKey:[_keyArray objectAtIndex:section]];
    return [data count];
}
//创建单位格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义一个静态标示符
    static NSString *cellIdentifier=@"Cell";
    //检查是否有闲置单元格 空闲是该单元格移除屏幕，则判定为闲置
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //创建单元格
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //给cell单元格赋值
    NSArray *data=[_dataDic objectForKey:[_keyArray objectAtIndex:indexPath.section]];
    
    NSString *fontName=[data objectAtIndex:indexPath.row];
    cell.textLabel.text=fontName;
    cell.textLabel.font=[UIFont systemFontOfSize:18];
    return cell;
}
//设置section的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _keyArray[section];
}
//设置title的数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _keyArray;
}
-(NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
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
