//
//  RootViewController.m
//  FontTableViewDemo
//
//  Created by wangx on 15/5/30.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

-(void)loadView{
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _fontsArray=[NSMutableArray arrayWithArray:[UIFont familyNames]];
    self.tableView.allowsMultipleSelectionDuringEditing=YES;
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteItem)];
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(changeTitle)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark TableView DataSource
//section中的row的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_fontsArray count];
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
//    NSLog(@"indexRow :%ld",(long)indexPath.row);
    //给cell单元格赋值
    NSString *fontName=[_fontsArray objectAtIndex:indexPath.row];
    cell.textLabel.text=fontName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)deleteItem{
    NSArray *indexPaths=self.tableView.indexPathsForSelectedRows;
    for (NSIndexPath *indexPath  in indexPaths) {
        NSInteger *index=indexPath.row;
        [_fontsArray removeObjectAtIndex:index];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.tableView reloadData];
    
    
}
-(void)changeTitle{
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
    }else{
        [self.tableView setEditing:YES animated:YES];
    }
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
