//
//  WebserviceCaller.m
//  BlockPrograming
//
//  Created by Tops on 1/1/15.
//  Copyright (c) 2015 Tops. All rights reserved.


#import "WebserviceCaller.h"
#import<objc/runtime.h>

#import "AppDelegate.h"
#define g_BaseURL @""

@implementation WebserviceCaller{
    AppDelegate *appDel;
}

static WebserviceCaller *singletonObj = NULL;
+ (WebserviceCaller *)sharedSingleton{
    @synchronized(self) {
        if (singletonObj == NULL)
            singletonObj = [[self alloc] init];
    }
    return(singletonObj);
}


- (id) init {
    appDel=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    return self;
}


-(void)BaseWsCall:(NSMutableDictionary *)params :(NSString *)fileNameURL
          success:(WebMasterSuccessBlock)successBlock{
    appDel=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
        if ([[responseObject objectForKey:@"FLAG"] boolValue]) {
            for( NSString *aKey in [responseObject allKeys] )
            {
                if ([aKey isEqualToString:@"MESSAGE"]) {
                }else if([aKey isEqualToString:@"FLAG"]){
                }else{
                    if ([[responseObject valueForKey:aKey] isKindOfClass:[NSArray class]]) {
                        NSArray *ary = [responseObject valueForKey:aKey];
                        NSArray *retunArray = [self convertArray:ary :aKey];
                        successBlock(retunArray);
                    }else if([[responseObject valueForKey:aKey] isKindOfClass:[NSMutableDictionary class]]){
                        NSMutableDictionary *dict = [responseObject valueForKey:aKey];
                        id instance =  [self convertDictonary:dict :aKey];
                        successBlock(instance);
                    }
                }
            }
        }else{
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
    }];
    
}

-(id)convertDictonary:(NSMutableDictionary *)dict :(NSString *)aKey{
    Class klass = NSClassFromString(aKey);
    if (klass) {
        // class exists
        id instance = [[klass alloc] init];
        uint count;
        objc_property_t* properties = class_copyPropertyList(klass, &count);
        NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName = property_getName(properties[i]);
            [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        }
        
        for( NSString *DataKey in [dict allKeys] )
        {
            
            if ([DataKey isEqualToString:@"id"]) {
                [instance setValue:[dict valueForKey:@"id"] forKey:[NSString stringWithFormat:@"%@_id",aKey]];
            }else{
                if ([propertyArray containsObject:DataKey]) {
                    [instance setValue:[dict valueForKey:DataKey] forKey:DataKey];
                }
            }

        }
        return instance;
    } else {
        // class doesn't exist
        return dict;
    }
    return nil;
}

-(NSArray *)convertArray:(NSArray *)ary :(NSString *)aKey{
    NSMutableArray *returnArray = [[NSMutableArray alloc]init];
    for (NSMutableDictionary *dict in ary) {
        id instance = [self convertDictonary:dict :aKey];
        [returnArray addObject:instance];
    }
    return returnArray;
}
-(void)baseImageUplaod:(NSMutableDictionary *)params :(NSString *)fileNameURL :(UIImage *)image :(NSString *)tag
                sucess:(WebMasterSuccessBlock)successBlock{
    NSString *url= [NSString stringWithFormat:@"%@%@",g_BaseURL,fileNameURL];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    AFHTTPRequestOperation *op = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        [formData appendPartWithFileData:imageData name:tag fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        [MBProgressHUD hideAllHUDsForView:appDel.window animated:YES];
        //        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        //        [MBProgressHUD hideAllHUDsForView:appDel.window animated:YES];
    }];
    [op start];
}

@end
