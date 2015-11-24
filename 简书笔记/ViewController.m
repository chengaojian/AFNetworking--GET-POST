//
//  ViewController.m
//  简书笔记
//
//  Created by 陈高健 on 15/11/24.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@end
@implementation ViewController

/**
 说明:首先要搭建本地服务器(PHP/.Net都可以)
 建立响应的测试网页
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //使用AFN提供的GET方法获取服务器上json文件
    //[self GET];
    //使用AFN提供的POST方法获取服务器上json文件
    [self POST];
}

//使用AFN提供的POST登陆并发回登陆信息
- (void)POST{
    //1.创建一个基于NSURLConnection的管理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //2.发送我们的POST请求
    //用户名密码
    NSDictionary *param = @{@"username":@"admin",@"password":@"123456"};
    //登陆到得网址
    [manager POST:@"http://localhost/login.php" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"post result====%@---%@",responseObject,[responseObject class]);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//使用AFN提供的GET方法获取服务器上json文件
- (void)GET{
    //1.首先创建一个管理者
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    //2.发送请求
    //在使用AFN的时候,直接传递我们url的字符串就可以了
    //AFN在反序列化的时候,默认是帮我们按照JSON的格式去解析
    [manager GET:@"http://localhost/videos.json" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        //第一个参数 operation 操作
        //第二个参数 responseObject
        NSLog(@"%@---%@",responseObject,[responseObject class]);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
