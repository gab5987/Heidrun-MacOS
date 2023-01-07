//
//  ServerGate.m
//  Heidrun MacOS Client
//
//  Created by Gabriel on 06/01/23.
//

#import <Foundation/Foundation.h>

#import "ServerGate.h"

@implementation ServerGate

NSString *dataFetched;
bool gotData = false;

- (void) getDataFrom:(NSString *)url {
    
    NSURLSession *sessionWithoutADelegate = [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURL *urlNS = [NSURL URLWithString: url];
    
    [[sessionWithoutADelegate dataTaskWithURL:urlNS completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Got response %@ with error %@.\n", response, error);
        NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        self.dataFetched = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
        // NSLog(@"DATA IN STRING: %@\n", self.dataFetched);
        self.gotData = true;
    }] resume];
}

@end
