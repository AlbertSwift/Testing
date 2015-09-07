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
    
    NSMutableDictionary *dictMerchantDetails = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                                @"testds123f@gmail.com",       @"email",
                                                @"qweqwe",    @"password",
                                                @"shopname",    @"name",
                                                @"234234", @"phone",
                                                @"23.0331792"    , @"latitude",
                                                @"72.5167519", @"longitude",
                                                @"", @"address",
                                                @""    , @"city",
                                                @"Music;", @"categories",
                                                nil];
    
    [[WebserviceCaller sharedSingleton]baseImageUplaod:dictMerchantDetails :@"http://192.168.0.14/okazyon/trunk/register.php" :[UIImage imageNamed:@"explore.png"] :@"profilepic" sucess:^(id responseData) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
