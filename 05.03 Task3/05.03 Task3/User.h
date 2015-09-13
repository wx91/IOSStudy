//
//  User.h
//  05.03 Task3
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
//    NSString *_username;
//    NSString *_password;
    //...
}
/**
 *  1.生成_userName属性
 *  2.为_userName属性自动生成set/get方法
 */
//readonly:不生成set方法，只有get方法
@property(nonatomic,copy) NSString *userName;


-(void)showInfo;

@end
