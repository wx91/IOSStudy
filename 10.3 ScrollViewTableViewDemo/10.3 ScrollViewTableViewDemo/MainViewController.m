//
//  MainViewController.m
//  10.3 ScrollViewTableViewDemo
//
//  Created by wangx on 15/6/29.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(void)loadView{
    [super loadView];
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 180)];
    scrollView.backgroundColor=[UIColor redColor];
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    scrollView.contentSize=CGSizeMake(320*5, 180);
    scrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scrollView];
    
    //将滑动视图添加到表视图上
    self.tableView.tableHeaderView=scrollView;
    
    float _x=0;
    for (int index=0;index<5;index++){
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0+_x, 0, 320, 180)];
        NSString *imageName=[NSString stringWithFormat:@"image%d.jpg",index+1];
        imageView.image=[UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        _x+=320;
    }
    UIPageControl *pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 150, 320, 30)];
    pageControl.numberOfPages=5;
    pageControl.tag=101;
    
    [self.view addSubview:pageControl];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        
    }else{
        int current=scrollView.contentOffset.x/320;
        UIPageControl *pageControl=(UIPageControl *)[self.view viewWithTag:101];
        pageControl.currentPage=current;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"row: %ld",(long)indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
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
