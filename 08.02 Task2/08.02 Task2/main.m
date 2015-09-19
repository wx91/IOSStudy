//
//  main.m
//  08.02 Task2
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Author.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //--------------键值路径的使用---------
        /*
        Book *book=[[Book alloc]init];
        Author *author=[[Author alloc]init];

        [book setValue:author forKey:@"author"];
        //通过键值路径，设置属性值
        [book setValue:@"莫言" forKeyPath:@"author.name"];
        
//        NSString *name=[author valueForKey:@"name"];
        //通过键值路径，访问属性值
        NSString *name=[book valueForKeyPath:@"author.name"];
        NSLog(@"name=%@",name);
         */
        
        //-----------KVC的运算---------
        Author *author=[[Author alloc]init];
        [author setValue:@"莫言" forKey:@"name"];
        
        Book *book1=[[Book alloc]init];
        book1.name=@"红高粱";
        book1.price=9.9f;
        
        Book *book2=[[Book alloc]init];
        book2.name=@"蛙";
        book2.price=10;
        
        NSArray *books=[[NSArray alloc]initWithObjects:book1,book2,nil];
        [author setValue:books forKey:@"issueBook"];
        //获取数组中所有book对象的价格
        NSArray *priceArray=[author valueForKeyPath:@"issueBook.price"];
        NSLog(@"priceArray:%@",priceArray);
        //获取数组中的个数
        NSNumber *count=[author valueForKeyPath:@"issueBook.@count"];
        NSLog(@"count:%@",count);
        
        NSNumber *sum=[author valueForKeyPath:@"issueBook.@sum.price"];
        NSLog(@"sum:%@",sum);
        
        //计算数组中所欲book对象的价格的平均值
        NSNumber *avg=[author valueForKeyPath:@"issueBook.@avg.price"];
        NSLog(@"avg=%@",avg);
        
        //取得数组中book对象价格最大值
        NSNumber *max=[author valueForKeyPath:@"issueBook.@max.price"];
        NSLog(@"max=%@",max);
        
        //取得数组中book对象价格最小值
        NSNumber *min=[author valueForKeyPath:@"issueBook.@min.price"];
        NSLog(@"min=%@",min);
    }
    return 0;
}
