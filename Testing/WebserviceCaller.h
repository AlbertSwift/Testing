//
//  WebserviceCaller.h
//  BlockPrograming
//
//  Created by Tops on 1/1/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate;
typedef void(^WebMasterSuccessBlock)(id responseData);
typedef void(^WebMasterFailureBlock)(NSError *error);

typedef void(^SiAlertSuccessBlock)();
typedef void(^SiAlertCancelBlock)();


@interface WebserviceCaller : NSObject
+ (WebserviceCaller *)sharedSingleton;
-(void)BaseWsCall:(NSMutableDictionary *)params :(NSString *)fileNameURL
          success:(WebMasterSuccessBlock)successBlock;


@end
