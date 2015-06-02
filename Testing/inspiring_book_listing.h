//
//  inspiring_book_listing.h
//  Testing
//
//  Created by Tops on 6/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface inspiring_book_listing : NSObject{
    
    NSString *inspiring_book_listing_id;
    NSString *title;
    NSString *description;
    NSString *image;
    
}

@property(nonatomic,retain) NSString *inspiring_book_listing_id;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *description;
@property(nonatomic,retain) NSString *image;


@end
