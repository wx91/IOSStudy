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
    
    _listArray=[UIFont familyNames];
    _tableView =[[UITableView alloc]initWithFrame:view.bounds style:UITableViewStyleGrouped ];
    
    _tableView.dataSource=self;//设置数据源，并实现数据源需要实现的方法
    _tableView.delegate=self;//设置委托方法
    [self.view addSubview:_tableView];
    
    
}

//表示图中有多少个selection 默认是为1
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return 1;
 }
 
#pragma mark TableView DataSource
//section中的row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_listArray count];
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
    NSString *fontName=[_listArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=fontName;
    cell.textLabel.font=[UIFont fontWithName:fontName size:18];
    
    //如果重用的单元格的row和上次选择的不一致则取消选中
    if (_index==indexPath.row) {
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType=UITableViewCellAccessoryNone;
    }
    return cell;
}
/*
 *1.单选
 *2.重用单元格的时候重置了内容，对于它的样式没有变更
 */

#pragma mark -UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //上次选中的cell 设置为没有选中
    NSIndexPath *lastIndex=[NSIndexPath indexPathForRow:_index inSection:0];
    UITableViewCell *lastCell=[tableView cellForRowAtIndexPath:lastIndex];
    lastCell.accessoryType=UITableViewCellAccessoryNone;
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    _index=indexPath.row;
    
    [_tableView performSelector:@selector(deselectRowAtIndexPath:animated:) withObject:indexPath afterDelay:.5];
    
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
