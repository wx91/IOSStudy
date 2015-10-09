//
//  WebImageView.h
//  16.6 ASIHttpDemo
//
//  Created by wangx on 15/7/5.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface WebImageView : UIImageView<ASIHTTPRequestDelegate>

-(void)setImageURL:(NSURL *)url;


@end
