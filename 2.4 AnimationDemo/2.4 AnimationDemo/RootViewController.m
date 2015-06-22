//
//  RootViewController.m
//  2.4 AnimationDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@end

@implementation RootViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self=[super initWithStyle:style];
    if (self) {
        self.title=@"IOS动画";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    viewAnimationArray=[NSArray arrayWithObjects:@"淡入、淡出",@"位置变换",@"缩放变换",
                        @"旋转动画",@"代理动画",@"过渡动画",@"Block 动画",nil];
    transitionArray=[NSArray arrayWithObjects:@"trainsition 1",@"trainsition 2",@"trainsition 3",@"trainsition 4", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return [viewAnimationArray count];
    }
    return [transitionArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section==0) {
        cell.textLabel.text=[viewAnimationArray objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text=[transitionArray objectAtIndex:indexPath.row];
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"UIView Animation";
    }else{
        return @"Core Animation";
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailViewController=[[DetailViewController alloc]initWithNibName:nil bundle:nil];
    detailViewController.section=indexPath.section;
    detailViewController.row=indexPath.row;
    detailViewController.title=(indexPath.section==0)?[viewAnimationArray objectAtIndex:indexPath.row]:
        [transitionArray objectAtIndex:indexPath.row];
    CATransition *transition=[CATransition animation];
    transition.type=@"cube";
    transition.subtype=kCATransitionFromRight;
    transition.duration=0.6;
    [self.navigationController.view.layer addAnimation:transition forKey:@"NavgationAnimation"];
    [self.navigationController pushViewController:detailViewController animated:YES];
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
