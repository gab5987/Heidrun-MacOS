//
//  ServerGate.h
//  Heidrun MacOS Client
//
//  Created by Gabriel on 06/01/23.
//

#ifndef ServerGate_h
#define ServerGate_h

#import <Foundation/Foundation.h>

@interface ServerGate : NSObject

// @property (strong, nonatomic) id someProperty;

- (int) someMethod;
- (NSString *) getDataFrom:(NSString *)url;

@end

#endif /* ServerGate_h */
