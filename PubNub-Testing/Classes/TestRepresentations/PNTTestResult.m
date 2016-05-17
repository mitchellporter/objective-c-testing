//
//  PNTTestResult.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestResult.h"

@interface PNTTestResult ()
@property (nonatomic, readwrite, assign) NSInteger statusCode;
@property (nonatomic, readwrite, assign) PNOperationType operation;
@property (nonatomic, readwrite, strong) PubNub *client;

@end

@implementation PNTTestResult

- (instancetype)initWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType {
    self = [super init];
    if (self) {
        _statusCode = statusCode;
        _client = client;
        _operation = operationType;
    }
    return self;
}

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType {
    return [[self alloc] initWithClient:client statusCode:statusCode operation:operationType];
}

- (void)PNT_assertWithPubNubObject:(PNResult *)result {
    XCTAssertNotNil(result, @"Can't pass in a nil PNResult to compare");
    XCTAssertEqual(self.statusCode, result.statusCode);
    XCTAssertEqual(self.operation, result.operation);
}

@end
