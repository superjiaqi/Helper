//
//  UIImageView+Addition.m
//  MyWebImage
//
//  Created by qianfeng on 15/8/25.
//  Copyright (c) 2015年 杜佳奇. All rights reserved.
//

#import "UIImageView+Addition.h"

@implementation UIImageView (Addition)

-(void)setImageWithURL:(NSString *)urlString{
    //用block修饰接受图片地址
    __block NSString *url=[urlString copy];
    //做一个全局队列
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    //异步调用
    dispatch_async(queue, ^{
        NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *image=[UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image=image;
        });
    });
}
@end
