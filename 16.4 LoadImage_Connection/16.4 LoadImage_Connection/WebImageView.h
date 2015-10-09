//
//  WebImageView.h
//  16.4 LoadImage_Connection
//
//  Created by wangx on 15/7/4.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebImageView : UIImageView<NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSMutableData *data;

-(void)setURL:(NSURL *)url;

@end
