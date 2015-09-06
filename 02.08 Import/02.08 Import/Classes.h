//
//  Claaes.h
//  02.08 Import
//
//  Created by wangx on 15/9/6.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Student.h"
/*
 *@class可以解决相互导入
 *至于这个类是如何定义的，有哪些方法，属性，当前文件是不知道的
 */
@class Student;
@interface Classes : NSObject{
    Student *_stu;
}

@end
