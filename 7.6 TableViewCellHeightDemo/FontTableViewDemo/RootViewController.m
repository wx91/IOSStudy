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
    
    _listArray = @[@"《岳阳楼记》是一篇为重修岳阳楼写的记。由北宋文学家范仲淹应好友巴陵郡守滕子京之请，于北宋庆历六年（1046年）九月十五日所作。其中的诗句“先天下之忧而忧，后天下之乐而乐”、“不以物喜，不以己悲”是较为出名和引用较多的句子。《岳阳楼记》能够成为传世名篇并非因为其对岳阳楼风景的描述，而是范仲淹借《岳阳楼记》一文抒发先忧后乐、忧国忧民的情怀", @"仁宗庆历四年春天，滕子京被降职到巴陵郡做太守。到了第二年，政事顺利，百姓和乐，各种荒废的事业都兴办起来。于是重新修建岳阳楼，扩增它旧有的规模，在岳阳楼上刻上唐代名家和当代人的诗赋。嘱托我写一篇文章来记述这件事", @"庆历四年春，滕（téng）子京谪（zhé）守巴陵郡。越明年，政通人和，百废具兴，乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上。属（zhǔ）予（yú）作文以记之", @"予观夫（fú）巴陵胜状，在洞庭一湖", @"至若春和景明，波澜不惊，上下天光", @"岸芷（zhǐ） 汀（tīng）兰", @"若夫（fú）淫（yín）雨霏霏，连月不开；阴风怒号，浊浪排空。日星隐曜（yào），山岳潜形。商旅不行，樯（qiáng）倾楫（jí）摧。薄（bó）暮冥冥（míng），虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥（jī），满目萧然，感极而悲者矣。", @"岸芷（zhǐ） 汀（tīng）兰", @"若夫（fú）淫（yín）雨霏霏，连月不开；阴风怒号，浊浪排空。日星隐曜（yào），山岳潜形。商旅不行，樯（qiáng）倾楫（jí）摧。薄（bó）暮冥冥（míng），虎啸猿啼。登斯楼也，则有去国怀乡，忧谗畏讥（jī），满目萧然，感极而悲者矣。", @"至若春和景明，波澜不惊，上下天光，一碧万顷（qǐng）。沙鸥翔集，锦鳞游泳；岸芷（zhǐ） 汀（tīng）兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧。渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕（xié）忘，把酒临风，其喜洋洋者矣。"];
    
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
    cell.textLabel.font=[UIFont fontWithName:fontName size:14];
    cell.textLabel.numberOfLines=0;//不限制列数
    cell.textLabel.text=fontName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text=[_listArray objectAtIndex:indexPath.row];
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(320, 1000)];
//    return size.height+20;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange allRange=[text rangeOfString:text];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0] range:allRange];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:allRange];
    
    CGFloat titleHeight;
    CGFloat labelWidth=240;
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect=[attrStr boundingRectWithSize:CGSizeMake(labelWidth, CGFLOAT_MAX) options:options context:nil];
    titleHeight=ceil(rect.size.height);
    return titleHeight+40;
}

/*
 *1.单选
 *2.重用单元格的时候重置了内容，对于它的样式没有变更


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
