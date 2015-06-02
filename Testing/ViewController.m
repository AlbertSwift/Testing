//
//  ViewController.m
//  Testing
//
//  Created by Tops on 6/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"
#import "user_data.h"
#import "inspiring_book_listing.h"
#import<objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableDictionary *param  = [[NSMutableDictionary alloc]init];
    [param setValue:@"dipen@tops.com" forKey:@"email"];
    [param setValue:@"tops" forKey:@"password"];
    [param setValue:@"" forKey:@"device_token"];
    
    [[WebserviceCaller sharedSingleton] BaseWsCall:param :@"http://192.168.0.28/idea_management/trunk/ws/user/login" success:^(id responseData) {
        user_data *data = responseData;
        NSLog(@"%@",data.user_data_id);
    }];
   
    
    [[WebserviceCaller sharedSingleton] BaseWsCall:param :@"http://topsdemo.in/mit/idea_management/ws/user/inspiring_book_list" success:^(id responseData) {
        NSArray *ary = responseData;
        for (inspiring_book_listing *book in ary) {
            NSLog(@"%@",book.title);
        }
    }];

    
    [[WebserviceCaller sharedSingleton] BaseWsCall:nil :@"http://192.168.0.143/idea_management/trunk/ws/user/great_thought_article_list" success:^(id responseData) {
        NSLog(@"%@",responseData);

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
