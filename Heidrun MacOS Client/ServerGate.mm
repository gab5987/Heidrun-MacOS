//
//  ServerGate.m
//  Heidrun MacOS Client
//
//  Created by Gabriel on 06/01/23.
//

#import <Foundation/Foundation.h>

#import "ServerGate.h"

@implementation ServerGate

- (int) someMethod {
    return 12;
}

- (NSString *) getDataFrom:(NSString *)url{
    
    // NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *sessionWithoutADelegate = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *urlNS = [NSURL URLWithString: url];
    
    __block NSData *possibleData;
    
    [[sessionWithoutADelegate dataTaskWithURL:urlNS completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Got response %@ with error %@.\n", response, error);
        NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        possibleData = data;
    }] resume];
    
    
    NSString *myString = [[NSString alloc] initWithData: possibleData encoding:NSUTF8StringEncoding];
    
    NSLog(@"DATA IN STRING: %@\n", myString);
    
    return myString;
}

@end
