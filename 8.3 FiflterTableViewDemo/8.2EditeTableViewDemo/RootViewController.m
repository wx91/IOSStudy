//
//  RootViewController.m
//  8.2EditeTableViewDemo
//
//  Created by wangx on 15/6/21.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fontsArray=[NSMutableArray arrayWithArray:[UIFont familyNames]];
    
    _data=[UIFont familyNames];
    
    UITextField *_textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 250, 30)];
    _textField.borderStyle=UITextBorderStyleRoundedRect;
    _textField.clearButtonMode=UITextFieldViewModeAlways;
    _textField.clearsOnBeginEditing=YES;
    _textField.delegate=self;
    _textField.returnKeyType=UIReturnKeyDone;
    [_textField addTarget:self action:@selector(filter:) forControlEvents:UIControlEventEditingChanged];
    self.navigationItem.titleView=_textField;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_fontsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 44)];
        label.tag=101;
        [cell.contentView addSubview:label];
    }
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:101];
    label.text=_fontsArray[indexPath.row];
    return cell;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)filter:(UITextField *)textField{
    if ([textField.text length]==0) {
        self.fontsArray=_data;
        [self.tableView reloadData];
    }else{
        NSString *regex=[NSString stringWithFormat:@"SELF LIKE[c]'%@*'",textField.text];
        NSPredicate *predicate=[NSPredicate predicateWithFormat:regex];
        self.fontsArray=[_data filteredArrayUsingPredicate:predicate];
        [self.tableView reloadData];
    }
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
