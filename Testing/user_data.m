//
//  user_data.m
//  Testing
//
//  Created by Tops on 6/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "user_data.h"

@implementation user_data
@synthesize email,user_data_id,facebook_id,status;

-(id) init {
    user_data *unshared = [super init];
    return unshared ;
}
@end
