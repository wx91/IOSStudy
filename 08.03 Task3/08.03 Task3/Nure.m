//
//  Nure.m
//  08.03 Task3
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "Nure.h"
#import "Children.h"
@implementation Nure

-(instancetype)initWithChildren:(Children *)children{
    self=[super init];
    if (self) {
        _children=children;
        //观察小孩的HappyValue的值
        //使用KVO为_children添加一个观察者，用于观察监听HappyValue属性值是否被修改
        [_children addObserver:self forKeyPath:@"happyValue"
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
        [_children addObserver:self forKeyPath:@"hungryValue"
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
    }
    return self;
}
//一旦属性值被修改，则调用该方法
//KVO触发方法，HappyValue值如果修改，则调用此方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context{
    if ([keyPath isEqualToString:@"happyValue"]) {
        //获取到happyValue最新的值
        NSNumber *happyValue=[change objectForKey:@"new"];
        NSInteger value=[happyValue integerValue];
        NSLog(@"快乐值是:%0.1%%f",value/100.0*100);
        if (value<80) {
            [self play];
        }
    }else if([keyPath isEqualToString:@"hungryValue"]){
        //获取hungryValue的最最新值
        NSNumber *hungryValue=[change objectForKey:@"new"];
        NSLog(@"饥饿值：%@",hungryValue);
        if([hungryValue integerValue ]<70){
            NSLog(@"保姆给小孩喂饭了！");
            [_children setHungryValue:100];
        }
    }
    

}

-(void)play{
    NSLog(@"保姆陪小孩玩了");
    [_children setHappyValue:100];
    //移除观察者
//    [_children removeObserver:self forKeyPath:@"happyValue"];
//    [_children removeObserver:self forKeyPath:@"hungryValue"];
}
@end
