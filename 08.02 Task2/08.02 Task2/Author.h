//
//  Author.h
//  08.02 Task2
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
//作者类---->书籍1，书籍2，书籍3
@interface Author : NSObject{
    @private
    NSString *_name;
    //作者出版的书
    NSArray *_issueBook;
    
}

@end
