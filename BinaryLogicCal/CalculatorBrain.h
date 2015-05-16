//
//  CalculatorBrain.h
//  BinaryLogicCal
//
//  Created by jewelz on 15/5/11.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CBOperationType)
{
    CBOperationTypeReturn = 0,
    CBOperationTypeAnd,
    CBOperationTypeOr,
    CBOperationTypeXor
};

@interface CalculatorBrain : NSObject
@property (strong, nonatomic, readonly) NSString *result;
- (NSString *)number:(NSString *)number operator:(NSString *)operator;
- (void)clear;
@end
