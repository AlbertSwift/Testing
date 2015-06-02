//
//  user_data.h
//  Testing
//
//  Created by Tops on 6/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface user_data : NSObject{

    NSString *user_data_id;
    NSString *facebook_id;
    NSString *email;
    NSString *status;
    
}

@property(nonatomic,retain) NSString *user_data_id;
@property(nonatomic,retain) NSString *email;
@property(nonatomic,retain) NSString *facebook_id;
@property(nonatomic,retain) NSString *status;

@end
