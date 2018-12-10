//
//  NSString+sm3.m
//  SM3
//
//  Created by GRV on 2018/12/7.
//  Copyright © 2018 GRV. All rights reserved.
//

#import "NSString+sm3.h"
#import "sm3.h"

@implementation NSString(sm3)

- (NSData *)sm3Data {
    if (!self.length) {
        return nil;
    }
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    int dataLength = (int)data.length;
    unsigned char dataArr[dataLength];
    memcpy(dataArr, data.bytes, dataLength);
    int outputLength = 32;
    unsigned char output[outputLength];
    sm3(dataArr, dataLength, output);
    return [NSData dataWithBytes:output length:outputLength];
}

- (NSString *)sm3 {
    NSData *sm3Data = [self sm3Data];
    NSString *sm3Str = [sm3Data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return sm3Str;
}

@end
