//
//  webserviceCallr1.h
//  Testing
//
//  Created by Tops on 9/7/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^WebMasterProgressBlock)(float responseData);

typedef void(^SiAlertSuccessBlock)();
typedef void(^SiAlertCancelBlock)();
typedef void(^DBSuccessBlock)();
typedef void(^DBFailurBlock)();

@interface webserviceCallr1 : NSObject

@end
