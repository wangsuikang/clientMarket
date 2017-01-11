//
//  SBJsonConnection.m
//  Tata2
//
//  Created by Chen Weigang on 12-2-29.
//  Copyright (c) 2012年 Fugu Mobile Limited. All rights reserved.
//

#import "SBJsonConnection.h"
#import "JSON.h"

@implementation SBJsonConnection


- (id)initWithURL:(NSURL *)url 
             post:(NSData *)d 
         delegate:(id)del 
{
    self = [super init];
    
    if (self) {
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];    
        NSString *strLength = [NSString stringWithFormat:@"%d", [d length]];
        [request setValue:strLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:d];	
        conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];             
        
        delegate = del;    
    }
    
    return self;
}

- (void)cancel
{
    [conn cancel];
}

- (void)dealloc {
    [conn cancel];
    [conn release], conn = nil;
    [data release], data = nil;
    [dict release], dict = nil;
    
    [super dealloc];
}


#pragma mark - NSURLConnection delegate 

// connection did finish
- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{		    
    NSString *strData = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];    
    NSString *jsonString = strData;
    
    SBJsonParser *jsonParser = [[[SBJsonParser alloc] init] autorelease];
    
    NSError *error = nil;
    
    [dict release], dict = nil;
    dict = [jsonParser objectWithString:jsonString];    
        
    if (dict==nil) {
        [delegate jsonConnectionDidFail:[error description]];
        [data release], data = nil;
        [conn release], conn = nil;
        
        [delegate jsonConnectionDidFail:@"json parser failed!"];
        return;
    }
        
    dict = [dict objectForKey:@"d"];
    NSLog(@"dict = %@", dict);
    [delegate jsonConnectionDidFinish:dict];
    
    [data release], data = nil;
    [conn release], conn = nil;
}


// connection did fail with error
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error 
{
    [delegate jsonConnectionDidFail:[error description]];
}


// connection did receive data
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d 
{	    
    if (data==nil) {
        data = [[NSMutableData alloc] initWithCapacity:1024];
    }
    
    [data appendData:d];	
}

@end
