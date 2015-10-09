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
    
    _tableView =[[UITableView alloc]initWithFrame:view.bounds style:UITableViewStyleGrouped ];
    _tableView.dataSource=self;//设置数据源，并实现数据源需要实现的方法
    
    [self.view addSubview:_tableView];
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
    NSLog(@"indexRow :%ld",(long)indexPath.row);
    //给cell单元格赋值
    if (indexPath.row%5==0) {
        cell.accessoryType=UITableViewCellAccessoryNone;
    }else if(indexPath.row%5==1){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.row%5==2){
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    }else if(indexPath.row%5==3){
        cell.accessoryType=UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType=UITableViewCellAccessoryDetailButton;
    }
    NSString *fontName=[self.listArray objectAtIndex:indexPath.row];
    cell.textLabel.text=fontName;
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
