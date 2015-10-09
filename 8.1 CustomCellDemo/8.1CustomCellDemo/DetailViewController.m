//
//  DetailViewController.m
//  8.1CustomCellDemo
//
//  Created by wangx on 15/6/20.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "DetailViewController.h"
#import "MyCell.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

-(void)loadView{
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _listArray=[UIFont familyNames];
    self.tableView.rowHeight=80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    if (self.cellType==1) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 44)];
            label.tag=101;
            label.backgroundColor=[UIColor redColor];
            [cell.contentView addSubview:label];
        }
        
        UILabel *label=(UILabel *)[cell.contentView viewWithTag:101];
        label.text=@"label内容";
        label.text=_listArray[indexPath.row];
        
        return cell;
    }else if (self.cellType==2){
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            NSArray *nibs=[[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
            cell=[nibs objectAtIndex:0];
        }
        UILabel *label=(UILabel *)[cell.contentView viewWithTag:201];
        label.text=_listArray[indexPath.row];
        
        UIImageView *imgView=(UIImageView *)[cell.contentView viewWithTag:202 ];
        imgView.backgroundColor=indexPath.row%2?[UIColor redColor]:[UIColor yellowColor];
        
        return cell;
    }else if (self.cellType==3){
        MyCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.text=_listArray[indexPath.row];
        return cell ;
    }else{
        return nil;
    }
    return nil;
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
