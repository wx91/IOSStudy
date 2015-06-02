//
//  DetailViewController.m
//  FontTableViewDemo
//
//  Created by wangx on 15/5/31.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "DetailViewController.h"

#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
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
    
    NSArray *array=[UIFont familyNames];
    _fontsArray = [[NSMutableArray alloc] initWithCapacity:15];
    NSMutableArray *temp;
    for (int index=0; index<[array count]; index++) {
        //取出字体内容
        NSString *font=array[index];
        //将5整除时，创建temp数组，添加到_fontArray
        if (index%5==0) {
            temp=[[NSMutableArray alloc]initWithCapacity:5];
            [_fontsArray addObject:temp];
        }
         [temp addObject:font];
    }
    UITableViewStyle sytle=self.isPlan?UITableViewStylePlain:UITableViewStyleGrouped;
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, kDeviceHeight-20-44) style:sytle];
    
    //设置tableview 的头和尾的标签
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
    headerView.backgroundColor=[UIColor clearColor];
    //添加子视图
    UILabel *headtext=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 200, 80)];
    headtext.text=@"秋高气爽";
    headtext.textAlignment=NSTextAlignmentCenter;
    headtext.numberOfLines=0;
    [headerView addSubview:headtext];
    _tableView.tableHeaderView=headerView;
    
    //设置表视图的尾部视图 footer添加子视图
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
    footerView.backgroundColor=[UIColor yellowColor];
    _tableView.tableFooterView=footerView;
    
    _tableView.dataSource=self;//设置数据源，并实现数据源需要实现的方法
    //设置代理方法
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}
//表示图中有多少个selection 默认是为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_fontsArray count];
}

#pragma mark TableView DataSource
//section中的row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"selection=%ld",section);
    NSLog(@"row=%lu",(unsigned long)[_fontsArray[section] count]);
    return [_fontsArray[section] count];
}
//创建单位格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSLog(@"indexPath%@",indexPath);
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *text=[_fontsArray[indexPath.section]objectAtIndex:indexPath.row];
    cell.textLabel.text=text;
    return cell;
}
//其中titleForHeaderInSection和viewForHeaderInSection无法共存
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title=[NSString stringWithFormat:@"第%ld个selection header",(long)section+1];
    return title;
}
//其中titleForFooterInSection和viewForFooterInSection无法共存
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSString *title=[NSString stringWithFormat:@"第%ld个selection footer",(long)section+1];
    return title;
}

#pragma mark TableView Delegate
//设置tableview 中的row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0&&indexPath.section==2) {
        return 80;
    }
    return 44;
    
}
//设置selection header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 80;
    }
    return 25;
}
//设置selection footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 80;
    }
    return 25;
}
//设置selection自定义的头部视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectZero];
    headerView.backgroundColor=[UIColor redColor];
    
    UILabel *tipLabel=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 200, 30)];
    tipLabel.numberOfLines=0;
    tipLabel.textAlignment=NSTextAlignmentCenter;
    tipLabel.text=[NSString stringWithFormat:@"selection header %ld",(long)section];
    [headerView addSubview:tipLabel];
    
    return headerView;
}
//设置selecton的自定义的尾部视图 viewForFooterInSection在tableview重新排版view
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectZero];
    footerView.backgroundColor=[UIColor yellowColor];
    
    UILabel *tipLabel=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 200, 30)];
    tipLabel.numberOfLines=0;
    tipLabel.textAlignment=NSTextAlignmentCenter;
    tipLabel.text=[NSString stringWithFormat:@"selection footer %ld",(long)section];
    [footerView addSubview:tipLabel];
    
    
    return footerView;
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
