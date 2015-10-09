//
//  DetailViewController.m
//  13.1 SpliteViewControllerDemo
//
//  Created by wangx on 15/7/1.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "DetailViewController.h"
#import "PopViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController



-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"详情窗口";
    }
    return self;
}
-(void)loadView{
    [super loadView];
    self.view.backgroundColor=[UIColor yellowColor];
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:@"pop窗口" style:UIBarButtonItemStylePlain target:self action:@selector(ClickAction:)];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    PopViewController *popViewController=[[PopViewController alloc]init];
    
    UINavigationController *popNav=[[UINavigationController alloc]initWithRootViewController:popViewController];
    
    self.popCtrl=[[UIPopoverController alloc]initWithContentViewController:popNav];
    self.popCtrl.popoverContentSize=CGSizeMake(320, 600);
    
    
    
}
-(void)ClickAction:(UIBarButtonItem *)buttonItem{
    if (self.popCtrl.popoverVisible) {
        [self.popCtrl dismissPopoverAnimated:YES];
    }else{
        [self.popCtrl presentPopoverFromBarButtonItem:buttonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
