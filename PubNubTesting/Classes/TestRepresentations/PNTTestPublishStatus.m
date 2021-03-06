//
//  PNTTestPublishStatus.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import "PNTTestPublishStatus.h"

@interface PNTTestPublishStatus ()
@property (nonatomic, readwrite, strong) NSNumber *timetoken;
@end

@implementation PNTTestPublishStatus

- (instancetype)initPublishStatusWithClient:(PubNub *)client statusCode:(NSInteger)statusCode isError:(BOOL)isError timeToken:(NSNumber *)timeToken {
    self = [super initAcknowledgmentStatusWithClient:client statusCode:statusCode operation:PNPublishOperation isError:isError];
    if (self) {
        _timetoken = timeToken;
    }
    return self;
}

+ (instancetype)successfulStatusWithClient:(PubNub *)client timeToken:(NSNumber *)timeToken {
    return [[self alloc] initPublishStatusWithClient:client statusCode:200 isError:NO timeToken:timeToken];
}

+ (PNTTestPublishStatus *)failedStatusWithClient:(PubNub *)client {
    return (PNTTestPublishStatus *)[PNTTestErrorStatus errorWithClient:client statusCode:400 operation:PNPublishOperation category:PNBadRequestCategory];
}

- (NSArray<NSString *> *)dataKeysToAssert {
//    NSMutableArray *superKeys = [super dataKeyPathsToAssert].mutableCopy;
//    [superKeys addObjectsFromArray:@[
//                                     @"data.timetoken",
//                                     ]];
//    return superKeys.copy;
    return @[
             @"data.timetoken"
             ];
}

@end
