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
    
    self.listArray=[UIFont familyNames];
    
    _tableView =[[UITableView alloc]initWithFrame:view.bounds style:UITableViewStylePlain];
    //_tableView.dataSource=self;//设置数据源，并实现数据源需要实现的方法
    //设置表视图cell的高度，高度是统一的
    _tableView.rowHeight=70;
    //设置表的背景图片
    UIImageView *backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_0410"]];
    _tableView.backgroundView=backgroundView;
    //设置表视图的背景颜色
//    _tableView.backgroundColor=[UIColor yellowColor];
    //设置表视图的分割线的颜色
    _tableView.separatorColor=[UIColor purpleColor];
    //设置表视图的分割线的风格
    _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    //设置表视图的头部视图(header view中添加子视图)
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
    headerView.backgroundColor=[UIColor redColor];
    _tableView.tableHeaderView=headerView;
    //添加子视图
    UILabel *headText=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 200, 80)];
    headText.text=@"天气晴朗，天气晴朗";
    headText.numberOfLines=0;
    [headerView addSubview:headText];
    
    _tableView.tableHeaderView=headerView;
    
    //设置表视图的头部视图(header view中添加子视图)
    UIView *fooerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
    fooerView.backgroundColor=[UIColor yellowColor];
    _tableView.tableFooterView=fooerView;
    
    [self.view addSubview:_tableView];
}
#pragma mark TableView DataSource
//section中的row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_listArray count];
}
//创建单位格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *fontName=[self.listArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=fontName;
    cell.textLabel.font=[UIFont fontWithName:fontName size:14];
    return cell;
}
//表示图中有多少个selection 默认是为1
/*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
