//
//  Book.h
//  08.02 Task2
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
@interface Book : NSObject{
    @private
    Author *_author;
}
@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)float price;

@end
