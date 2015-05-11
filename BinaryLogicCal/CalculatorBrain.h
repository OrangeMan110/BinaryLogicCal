//
//  CalculatorBrain.h
//  BinaryLogicCal
//
//  Created by jewelz on 15/5/11.
//  Copyright (c) 2015年 yangtzeu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (NSString *)number:(NSString *)number operation:(NSString *)operation;
- (void)calculateResult;
- (void)clear;
@end
