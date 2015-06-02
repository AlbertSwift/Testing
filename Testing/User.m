//
//  User.m
//  Testing
//
//  Created by Tops on 6/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize Userid;
-(id) init {
    User *unshared = [super init];
    return unshared ;
}

@end
