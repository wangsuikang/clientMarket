//
//  SBJsonConnection.h
//  Tata2
//
//  Created by Chen Weigang on 12-2-29.
//  Copyright (c) 2012年 Fugu Mobile Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SBJsonConnectionDelegate;

@interface SBJsonConnection : NSObject {
    NSDictionary        *dict;
    NSURLConnection     *conn;
    NSMutableData       *data;
    
    id<SBJsonConnectionDelegate>    delegate;
}

- (id)initWithURL:(NSURL *)url 
             post:(NSData *)data 
         delegate:(id)delegate;

- (void)cancel;

@end


@protocol SBJsonConnectionDelegate
@required
- (void)jsonConnectionDidFinish:(NSDictionary *)dict;
- (void)jsonConnectionDidFail:(NSString *)tips;
@end