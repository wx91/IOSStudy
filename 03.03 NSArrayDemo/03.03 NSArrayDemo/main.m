//
//  main.m
//  03.03 NSArrayDemo
//
//  Created by wangx on 15/9/9.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //不可变数据(NSArray)
    //1.数组的创建 存储的都是指针
    NSString *s1=@"zhangsan";
    NSString *s2=@"lisi";
    NSString *s3=@"wangwu";
    //注意：最后以nil结尾
    NSArray *array1=[[NSArray alloc]initWithObjects:s1,s2,s3, nil];
    NSLog(@"%@",array1);
    
    //使用类方法创建
    NSArray *array2=[NSArray arrayWithObjects:s1,s2,s3,nil];
    //创建一个数组对象，同时往里面存入一个元素
    NSArray *array3=[NSArray arrayWithObject:s1];
    //创建一个数组，此数组中的元素来自array1
    NSArray *array4=[NSArray arrayWithArray:array1];
    NSLog(@"array4=%@",array4);
    
    
    //2.通过下标取元素
    NSString *str1=[array4 objectAtIndex:0];
    NSLog(@"stri=%@",str1);
    
    //3.获取数组元素的个数
    NSUInteger count1=[array4 count];
    NSUInteger count2=array4.count;//等价于array4 count
    NSLog(@"count2=%ld",count2);
    //4.判断数组中是否包含某一个对象
    BOOL isContains=[array4 containsObject:@"zhangsan"];
    NSLog(@"isContains:%d",isContains);
    
    //5.查找一个对象在数组中的下标位置
    NSUInteger index=[array4 indexOfObject:@"wangwu"];
    if (index==NSNotFound) {
        NSLog(@"没有找到元素");
    }else{
        NSLog(@"index=%ld",index);
    }
    
    //6.连接数组中的字符串，
    //注意：数组中的元素必须全都是字符串，才可以使用此方法连接
    NSString *joinstring=[array4 componentsJoinedByString:@","];
    NSLog(@"joinstring=%@",joinstring);
    //7.访问数组中的最后一个元素
    NSString *lastObj=[array4 lastObject];
//    NSString *lastObj=array4.lastObject;//等价于[array4 lastObject]
    NSLog(@"lastObject=%@",lastObj);
    //8.在原来的数组里面追加一个元素
    //追加之后，创建一个新的数组
    NSArray *array5=[array4 arrayByAddingObject:@"zhaoli"];
    NSLog(@"array5=%@",array5);
    
    /**
     *  注意:
     *  1.数组中不能存放基本数据类型，只能存对象
     *  2.数组越界
     */
    //错误，基本数据类型不能存放在数组
//    NSArray *array6=[NSArray arrayWithObject:10];
    //有数组越界的风险
    int idx=3;
//    [array5 objectAtIndex:idx];
    //严谨写法，只有下标小于元素的个数时，才能使用下标取元素
    if (idx<array4.count) {
        NSString *s=[array5 objectAtIndex:idx];
        NSLog(@"s=%@",s);
    }
    
    //数组遍历
    //1.普遍遍历
    for (int i=0; i<array5.count; i++) {
        NSString *str=[array5 objectAtIndex:i];
        NSLog(@"%@",str);
        //如果在循环里面要使用下标，则不要使用快速遍历
//        if (i==2) {
//        }
    }
    
    //2.快速遍历
    for (NSString *s in array5) {
        NSLog(@"%@",s);
    }
    //Xcode4.4后 编译器对语法进行升级
//    int a[]={1,2,3,3};
//    int b=a[0];
    //1.创建一个数组
    NSArray *array7=@[s1,s2,s3];
//    等价于 array7=[NSArray arrayWithObjects:s1,s2,s3, nil]
    NSLog(@"array7=%@",array7);
    
    NSString *str2=array7[0];
    NSLog(@"array[0]=%@",str2);
    
    
    //可变数组(NSMutableArray)
    //1.创建可变数组
    NSString *t1=@"zhangsan";
    NSString *t2=@"lisi";
    NSString *t3=@"wangwu";
    //错误，这里是创建了一个不可变数组
//    NSMutableArray *mArray1=@[t1,t2,t3];
    NSMutableArray *mArray1=[NSMutableArray arrayWithObjects:t1,t2,t3, nil];
    //创建数组时，开辟3个空间用于存储元素，当存储的元素超过了3个，数组会自动增加空间
    NSMutableArray *mArray2=[[NSMutableArray alloc]initWithCapacity:3];
    NSMutableArray *mArray3=[NSMutableArray arrayWithCapacity:3];
    
    //2.添加元素
    [mArray2 addObject:t1];
    [mArray2 addObject:t2];
    [mArray2 addObject:t3];
    //...
    //将mArray2中所有的元素全部添加到mArray3,mArray2中的元素没有被删除
//    [mArray3 addObjectsFromArray:mArray2];
//    NSLog(@"mArray3=%@",mArray3);
    
    //将mArray2 作为二维数组添加到mArray3
//    [mArray3 addObject:mArray2];
//    NSLog(@"mArray3=%@",mArray3);
    
    //3.插入元素
    [mArray2 insertObject:@"赵六" atIndex:0];
    NSLog(@"mArray2=%@",mArray2);
//    [mArray2 insertObject:@"赵六" atIndex:5];//错误，数组越界
    //4.替换元素
    [mArray2 replaceObjectAtIndex:0 withObject:@"jack"];
    NSLog(@"mArray2=%@",mArray2);
    //5.互换两个元素的位置
    [mArray2 exchangeObjectAtIndex:3 withObjectAtIndex:0];
    NSLog(@"mArray2=%@",mArray2);
    
    //6.删除元素
    //6.1 根据下标删除元素
    [mArray2 removeObjectAtIndex:2];
    NSLog(@"mArray2=%@",mArray2);
    //6.2 删除最后一个元素
    [mArray2 removeLastObject];
    NSLog(@"mArray2=%@",mArray2);
    //6.3 删除指定的对象
    [mArray2 removeObject:@"zhangsan"];
    NSLog(@"mArray2=%@",mArray2);
    //6.4删除所有元素
    [mArray2 removeAllObjects];
    NSLog(@"mArray2=%@",mArray2);
    
    return 0;
}
